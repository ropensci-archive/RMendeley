> groups(mendeley_cred)
       id                                      name    type size
1  530031                         Future of Science  public  194
2  665771                    Mendeley Advisor Group private   36
3 1054371       University of California - Berkeley  public    0
4 1146031                 Workflow Analysis Project private  429
5 1158301                              Optimization private   17
6 1189721 Scientific Workflows and Workflow Systems  public  464
7 1377483                     Workflow review paper private   13
8 1377653           Stage Structured Modeling Group private   14
>
> user_profile(mendeley_cred)
$main
                                                                                                                            profile_id
                                                                                                                               "39369"
                                                                                                                                  name
                                                                                                                         "Karthik Ram"
                                                                                                                         discipline_id
                                                                                                                                   "3"
                                                                                                                       discipline_name
                                                                                                                 "Biological Sciences"
                                                                                                                       academic_status
                                                                                                                            "Post Doc"
                                                                                                                    research_interests
                                                                "Food webs, trophic cascades, predator-prey dynamics, Bioinformatics."
                                                                                                                              location
                                                                                                 "Berkeley, California, United States"

> groupPeople(mendeley_cred, 530031)
      user_id                               name    status
2        name                     Carl Boettiger     owner
2100      110                       Rebecca Holz followers
3         127                       Jan Reichelt followers
4         749                         Eric Meyer followers
5        1564                     Gosia Stergios followers
6        1659                            Jim Law followers
7        4436                  Tolulope Olugboji followers
8       10116                     Nicholas Jones followers
9       11328                     Sebastian Arcq followers
10      17807                      Ruth Harrison followers
11      20311                      Mike Lawrence followers
12      21517                      Felix Neumann followers
13      21598                          Karl Fast followers
14      23874                     Connor Bamford followers
15      25430                      nabila taqafi followers
16      36226                   matteo zucchetta followers
17      36248                      Dominik Weber followers


> Folders(mendeley_cred)
         id                      name size   parent
1   7751951            Academic stuff   10     none
2   7751961 Unpublished Presentations    9     none
3   7775491                     Books   22     none
4   7777041     Dissertation Research  376     none
5   7783851       Theoretical Ecology    4 11855471
6   7783861          Parasite Ecology    6 11855471
7   7783871        Population Ecology    3 11855471
8   8323561                Pre prints    2 11855471
...

> pubStats(mendeley_cred)
                                                      name value
1                                                  Ecology   139
2                                          Ecology Letters    73
3                                                    Oikos    66
4                                Journal of animal ecology    59
5                                     Ecological Modelling    43
6                                          Global Change B    41

> mendeley_library(mendeley_cred)
$total_results
[1] 1509

$total_pages
[1] 76

$current_page
[1] 0

$items_per_page
[1] 20

$document_ids
 [1] "4043909022" "4044039162" "4388655175" "4827392212" "4269923042"
 [6] "4269915872" "4269915982" "4536914155" "4388655915" "4269918542"
[11] "4370418895" "4106270232" "4098512522" "4630966585" "4044038462"
[16] "4044035612" "4388655105" "4044036532" "4044039022" "4043907252"




> addContact(mendeley_cred, '12356')
[1] "Your contact request has been successfuly sent to user with profile id (12356)."

> user_author_stats(mendeley_cred)
  value            name
1    25        H K Kaya
2    23      D R Strong
3    21 A M Koppenhofer
4    17   M Hebblewhite
5    17       R Gaugler


> tagStats(mendeley_cred)


[[1]]
                    period                       tags
        "15-21 March 2012" "No tags for this period."

[[2]]
[[2]]$period
[1] "22-28 March 2012"

[[2]]$tags
[[2]]$tags[[1]]
     name     count
"foodweb"       "1"

[[2]]$tags[[2]]
                  name                  count
"individual variation"                    "1"

[[2]]$tags[[3]]
       name       count
"predation"         "1"



> user_contacts(mendeley_cred)
   profile_id               name
1     2202631      Andrew Bennie
…


> authoredPubs(mendeley_cred)
$total_results
[1] 2

$total_pages
[1] 1

$current_page
[1] 0

$items_per_page
[1] 20

$document_ids
[1] "4032561202" "4032546762"


> folderDocs(mendeley_cred, 7775491)
$total_results
[1] 22

$total_pages
[1] 2

$current_page
[1] 0

$items_per_page
[1] 20

$document_ids
 [1] "4534064145" "4044035482" "4043905932" "4043905922" "4043905942"
 [6] "4044035542" "4044035532" "4044035522" "4044035402" "4044035502"
[11] "4651090705" "4554706805" "4044035512" "4044035492" "4362580325"
[16] "4044035462" "4044035472" "4044035452" "4044035442" "4044035432"

$folder_id
[1] "7775491"

$folder_name
[1] "Books"

> createFolder(mendeley_cred, "This is a test")
New folder successfully created
An object of class "MendeleyFolderID"
[1] "26211683"



> deleteFolder(mendeley_cred, 'TESTING')
Folder  TESTING : 26137113 deleted successfully



> groupPeople(mendeley_cred, 1146031)
   user_id               name  status
2     name        Karthik Ram   owner
21   39369        Karthik Ram members
3    98752     Carl Boettiger members
4  5088741   Richard Littauer members
5  5089461 Bertram Ludaescher members
6  5089571   William Michener members
7  5345011    Rebecca Koskela members


> groupDocs(mendeley_cred, 1146031)
$total_results
[1] 429

$total_pages
[1] 22

$current_page
[1] 0

$items_per_page
[1] 20

$document_ids
 [1] "4315939232" "4315938792" "4284136442" "4279105742" "4315939152"
 [6] "4323615152" "4315938662" "4315938752" "4323615362" "4323615352"
[11] "4315937262" "4465184785" "4465184655" "4414338715" "4301171712"
[16] "4315938402" "4323615882" "4315939282" "4315939112" "4323616242"

$group_id
[1] "1146031"

$group_name
[1] "Workflow Analysis Project"

$group_type
[1] "private"

$group_invite_only
[1] "1"



> groupDocInfo(mendeley_cred, 1146031, 4315939232)
$authors
$authors[[1]]
forename  surname
   "Jia"     "Yu"

$authors[[2]]
  forename    surname
"Rajkumar"    "Buyya"


$cast
list()

$citation_key
[1] "Yu2006e"

$doi
[1] "10.1109/WORKS.2006.5282330"

$editors
list()

$isbn
[1] "978-1-4244-5215-6"

$keywords
list()

$month
[1] "6"

$pages
[1] "1-10"

$producers
list()

$published_in
[1] "2006 Workshop on Workflows in Support of Large-Scale Science"

$publisher
[1] "Ieee"

$title
[1] "A budget constrained scheduling of workflow applications on utility Grids using genetic algorithms"

$translators
list()

$url
[1] "http://ieeexplore.ieee.org/lpdocs/epic03/wrapper.htm?arnumber=5282330"

$year
[1] "2006"

$id
[1] "4315939232"

$type
[1] "Journal Article"

$tags
[1] "Cites Lud\xe4scher 2006"

$publication_outlet
[1] "2006 Workshop on Workflows in Support of Large-Scale Science"

$identifiers
                         doi                         isbn
"10.1109/WORKS.2006.5282330"          "978-1-4244-5215-6"

$mendeley_url
[1] "http://www.mendeley.com/research/budget-constrained-scheduling-workflow-applications-utility-grids-using-genetic-algorithms-3/"

$canonical_id
[1] "e886d0b0-a088-11df-9d6a-0024e8453de6"

$files
$files[[1]]
                                 file_hash
"792467b171776b31104e2b4cbb34f31263394884"
                                 file_size
                                  "390240"
                            file_extension
                                     "pdf"
                                date_added
                     "2010-02-10 03:27:53"


$modified
[1] 1318493864

$added
[1] 1308665350

$discipline
[1] "Linguistics"

$subdiscipline
NULL


> createGroup(mendeley_cred, "test_group", type="invite")
An object of class "MendeleyGroupID"
[1] "2067243"
