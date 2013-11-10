patt = new RegExp(parser_description[1].regex, "gi");

var take_ = 0;
var function_name_ = 1;
var tree_ = 2;

function reparse_emulator(take, function_name, tree, matches, functions) {
    var results = []
    current_position = 0;
    for (element_index in tree) {
        element = tree[element_index];
        results.push(reparse_emulator(
            element[take_],
            element[function_name_],
            element[tree_], 
            matches.slice(current_position, element[take_]),
            functions
        ));
        current_position += element[take_];
    }
    if (tree.length == 0) 
        functions[function_name].apply(functions[function_name], matches.slice(0, take));
    console.log(function_name);
    return functions[function_name].apply(functions[function_name], results);
}


o  = patt.exec('June 1-2').slice(1);
p = parser_description[1].tree;
console.log(reparse_emulator(p[0], p[1], p[2], o, functions));
