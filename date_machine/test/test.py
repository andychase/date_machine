import unittest
from corpus import corpus
from date_machine import build_date_parser

wrong_answer_msg = "Wrong answer for : {}/{}. \nGot:      {}\nExpected: {}\n"
no_match_msg = "No match for: {}"


class dates_parser_test(unittest.TestCase):
    def test_expression_examples(self):
        date_parser = build_date_parser()
        for test_category, tests in corpus.items():
            for test, answer in tests.items():
                results = date_parser(test)
                self.assertNotEqual(results, None, no_match_msg.format(test))
                self.assertTrue(any(results), no_match_msg.format(test))
                self.assertEqual(results, answer, wrong_answer_msg.format(test_category, test, results, answer))
