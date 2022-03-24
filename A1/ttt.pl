start:- nl,write('...............This is a M.Tech Electives Advisory System...............'),nl,
    write('...............Please answer the questions given below...............'),nl,nl,
    reset,student_info,generate_electives,convert_to_list(Electives),nl,
    write('The recommended list of electives is as following: ' ),nl,
    write(Electives).

reset:-
    retractall(aa(_)),retractall(branch(_)),retractall(cgpa(_)),retractall(future(_)),
    fail.
reset.

student_info:-
    course_grades,info_programming,future_ml,future_ai,future_networking,future_informationsecurity,future_graphics,future_data,future_higherstudies.

course_grades:-
    write('Enter your branch '),read(X),assert(branch(X)),
    write('Enter your Undergraduate CGPA '),read(Marks),assert(cgpa(Marks)),nl,
    write('Please answer with y or n only.'),nl,
    write('Do you have a strong grasp of mathematics and statistics?'),read(Y),Y == y,
    assert(aa(ms)),nl,
    write('Are you considering a career in:'),nl.

info_programming:-
    write('Programming?'),read(Y),Y == y,
    assert(aa(programming)).
info_programming.

future_ml:-
    write('Machine learning field?'),read(Y),Y == y,
    assert(future(ml)).
future_ml.

future_ai:-
    write('Artificial Intelligence field?'),read(Y),Y == y,
    assert(future(ai)).
future_ai.


future_data:-
    write('Data mining and warehousing Field?'),read(Y),Y == y,
    assert(future(data)).
future_data.

future_networking:-
    write('Networking field?'),read(Y),Y == y,
    assert(future(networking)).
future_networking.

future_graphics:-
    write('Graphic designing?'),read(Y),Y == y,
    assert(future(graphics)).
future_graphics.

future_informationsecurity:-
    write('Information Security?'),read(Y),Y == y,
    assert(future(is)).
future_informationsecurity.


future_higherstudies:-
    nl,
    write('Do you want to study further? '),read(Y),Y == y,
    assert(interested(higher_studies)).
future_higherstudies.

convert_to_list([Px|Tail]):- retract(recommended(Px)), convert_to_list(Tail).
convert_to_list([]).

generate_electives:- aa(ms), cgpa(M),M >= 7.5,future(ml),
    assert(recommended(machinelearning_Or_Statisticalmachinelarning)),
    fail.
generate_electives:- aa(ms), cgpa(M),M >= 7.5,future(ai),
    assert(recommended(artificialIntelligence_Or_IntelligentSystems)),
    fail.
generate_electives:- aa(ms),aa(programming),cgpa(M),M >= 6.5,
    assert(recommended(program_analysis)),
    fail.
generate_electives:- aa(ms),aa(programming),cgpa(M),M >= 6.5,
    assert(recommended(graduateAlgorithm_Or_ModernAlgorithmDesign)),
    fail.
generate_electives:- aa(ms),cgpa(M),M >= 6.5,future(data),
    assert(recommended(dataMining)),
    fail.
generate_electives:- aa(ms),cgpa(M),M >= 6.5,future(data),
    assert(recommended(bigBataAnalytics)),
    fail.
generate_electives:- future(graphics),future(is),cgpa(M),M >= 6,
    assert(recommended(computerArchitecture)),
    fail.
generate_electives:- future(graphics),future(is),cgpa(M),M >= 6,
    assert(recommended(ethicalhacking)),
    fail.
generate_electives:- future(graphics),cgpa(M),M >= 6,
    assert(recommended(computerGraphics)),
    fail.
generate_electives:- future(ai),future(ml),cgpa(M),M >= 8,aa(maths),future(higher_studies),
    assert(recommended(artificial_intelligence_and_machinelearning)),
    fail.
generate_electives:- future(networking),cgpa(M),M >= 6.5,aa(maths),
    assert(recommended(embeddedsystems)),
    fail.
generate_electives:- future(networking),cgpa(M),M >= 6.5,aa(maths),
    assert(recommended(mobilecomputing_and_embeddedsystems_and_mobileandcellularnetworksecurity)),
    fail.
generate_electives:- future(networking),cgpa(M),M >= 6.5,aa(maths),
    assert(recommended(wirelessnetworks_and_networksecurity_and_distributedsystems)),
    fail.
generate_electives:-
    nl,write('................Thank you for your responses................'),nl.
