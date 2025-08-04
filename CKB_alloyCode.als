// Signatures code

sig Student {}
sig Educator {}

sig StudentStats {
    student: Student,
    score: Int
}{
    score > 0
}

sig Tournament {
    students: set Student,
    educators: set Educator,
    scores: set StudentStats,
    battles: set Battle
}{
    #educators > 0
    #students > 0 //the Tournament must have at least one Student enrolled
    #battles > 0 // the Tournament must have at least one Battle
    #scores = #students
}

sig CodeKata{}

sig Battle {
    creator: Educator,
    teams: set Team,
    maxNumOfStudents: Int,
    minNumOfStudents: Int,
    codeKata: one CodeKata	

}{
    #teams > 0
    maxNumOfStudents >= minNumOfStudents
    maxNumOfStudents > 0
    minNumOfStudents > 0
}

sig GitHubRepo {}

sig Team {
    members: set Student,
    repo: GitHubRepo,
    score: Int
}{
    score > 0
} 


// Facts code 

// Every Battle must exist in the context of a Tournament
fact noTournamentlessBattle {
    no b: Battle | not b in Tournament.battles
}

// Every Battle must be part of one and only one Tournament
fact battleBelongsToOneTournament {
    all disj t1, t2: Tournament, b: Tournament.battles |
    b in t1.battles and b in t2.battles iff t1=t2
}

// Each Battle has its own CodeKata
fact codeKataBelongsToOneBattle {
    all disj b1, b2: Battle, ck: Battle.codeKata |
    ck = b1.codeKata and ck = b2.codeKata iff b1=b2
}

// An Educator can create a Battle if he has been granted access 
// (i.e. he is part of the educators for one specific Tournament)
fact educatorCanCreateBattle {
    all t: Tournament, e: Educator, b: t.battles |
        e in b.creator iff e in t.educators
}

// Every Team must exist in the context of a Battle
fact noBattlelessTeam{
    no t: Team | not t in Battle.teams
}

// Every Team must participate in one and only one Battle
fact TeamBelongsToOneBattle {
    all disj b1, b2: Battle, t: Battle.teams |
    t in b1.teams and t in b2.teams iff b1=b2
}

// Every Team must comply to its Battle criteria w.r.t. the number of participants
fact NumOfParticipants {
    all b: Battle, t: b.teams | 
        #t.members <= b.maxNumOfStudents and #t.members >= b.minNumOfStudents
}

// Every GitHubRepo must exist in the context of a Team
fact noRepoLessTeam{
    no g: GitHubRepo | not g in Team.repo
}

// Each Team has its own GitHubRepo
fact gitHubRepoBelongsToOneTeam {
    all disj t1, t2: Team, g: Team.repo |
    g = t1.repo and g = t2.repo iff t1=t2
}

// A Student can participate to a Battle if he subscribed to a Tournament
fact StudentCanParticipateToBattle {
    all t: Tournament, s: Student, team: Team |
        s in team.members implies s in t.students
}

// A Student cannot participate to the same battle with multiple Teams
fact OneTeamForEachStudent {
    all b: Battle, disj t1, t2: b.teams, s: b.teams.members |
        s in t1.members iff not s in t2.members
}

// Only the students subscribed to a Tournament own a StudentStats signature
fact noStudentStats {
    all s: Student | not s in Tournament.students implies not s in StudentStats.student 
}

// There are no multiple StudentStats associated to the same Student
fact oneStudentOneStudentStats {
    all t: Tournament, disj ss1, ss2: t.scores, s: t.students |
        s in ss1.student and s in ss2.student iff ss1=ss2		
}

// Every student subscribed to a Tournament must have a StudentStats signature associated to that Tournament
fact studentHasStudentStats {
    all t: Tournament, s: t.students |
        s in t.scores.student and #t.students = #t.scores
}

// Every StudentStats is associated to only one Tournament
fact oneStudentStatsForEachTournament {
    all disj t1, t2: Tournament, ss: Tournament.scores |
    ss in t1.scores and ss in t2.scores iff t1=t2
}

// Every StudentStats must exist in the context of a Tournament
fact noTournamentlessStudentStats {
    no ss: StudentStats | not ss in Tournament.scores
}

// retrieves all the teams in a Tournament t where Student s is a member
fun getTeams[s: Student, t: Tournament]: set Team {
    let teams = {tm: Team | tm in t.battles.teams and s in tm.members} | teams
}

// returns the sum of the scores of a set of Teams
fun computeScore[teams: set Team]: Int { 
    sum t: teams | t.score
}

// the score of a Student in a Tournament is equal to the sum of the Battle's score in which the Student has participated
fact score {
    all t: Tournament, s: t.students, ss: t.scores | 
        //ss.student = s implies ss.score = sum[getTeams[s, t].score]
        ss.student = s implies ss.score = computeScore[ getTeams[s,t] ]
}


// World creation
run ckb {
    // costraints  
    #Tournament = 2
    some t: Tournament | #t.battles > 3
    some s: Student | not s in Tournament.students
    #Student > 5	
    some b: Battle | #b.teams > 1
    some t: Team | #t.members > 3	

} for 3 but 5 Educator, 20 Student, 40 StudentStats, 10 Team, 10 GitHubRepo, 5 Battle, 5 CodeKata