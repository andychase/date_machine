"""
>>> build_date_parser()('Jan 1')[0].to_datetime(2001, None, None).isoformat()
'2001-01-01T00:00:00'
"""
import reparse
from python.functions import functions


def build_date_parser(parser_type=reparse.basic_parser):
    return reparse.parser(
        parser_type=parser_type,
        functions=functions,
        expressions_yaml_path='data/expressions.yaml',
        patterns_yaml_path='data/patterns.yaml'
    )

parse = build_date_parser()
