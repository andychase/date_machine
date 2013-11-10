import reparse
from date_machine import build_date_parser
import sys
sys.path.append('..')
from test.evaluate import evaluate_msg

modes = {
    'python': reparse.basic_parser,
    'tree': reparse.build_tree_parser,
    'eval': lambda _: evaluate_msg(reparse.pattern_list(_))
}


def cli(_, mode='tree', verbose=''):
    verbose = True if verbose == 'verbose' else False
    if verbose:
            modes['eval'] = lambda _: evaluate_msg(reparse.pattern_list(_), True)

    if mode == 'tree':
        import json
        print(json.dumps(build_date_parser(modes['tree'])))
        return

    if mode not in modes:
            print('Invalid mode. Modes: {}'.format(", ".join(modes.keys())))
            return

    print build_date_parser(modes[mode])


if __name__ == "__main__":
    cli(*sys.argv[:3])
