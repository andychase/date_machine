import reparse
import sys
sys.path.append('..')
from date_machine import build_date_parser
from test.evaluate import evaluate_msg
from javascript.generate_javascript import generate_js

modes = {
    'python': reparse.basic_parser,
    'tree': reparse.build_tree_parser,
    'eval': lambda _: evaluate_msg(reparse.pattern_list(_)),
    'js': lambda _: generate_js(reparse.build_tree_parser(_))
}


def cli(_, mode='tree', verbose=''):
    verbose = True if verbose == 'verbose' else False
    if verbose:
            modes['eval'] = lambda _: evaluate_msg(reparse.pattern_list(_), True)

    if mode not in modes:
            print('Invalid mode. Modes: {}'.format(", ".join(modes.keys())))
            return

    print build_date_parser(parser_type=modes[mode])


if __name__ == "__main__":
    cli(*sys.argv[:3])
