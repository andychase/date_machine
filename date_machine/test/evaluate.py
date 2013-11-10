#!python
from date_machine.test.corpus import corpus


def percentage(part, whole):
    if whole == 0:
        return 0
    return round(100 * float(part) / float(whole))


def evaluate(patterns, verbose=False):
    results = {date_type: 0 for date_type in corpus}

    for date_type, tests in corpus.items():
        if verbose:
            print "---- {} ----".format(date_type)
        for test, answer in tests.items():
            temp = results[date_type]
            for pattern in patterns:
                if verbose:
                    print "{} -> {}".format(test, pattern.findall(test))
                if set(pattern.findall(test)) == set(answer):
                    results[date_type] += 1
            if results[date_type] == temp:
                print test

    # Print results
    final_results = []
    for date_type, value in corpus.items():
        final_results.append(percentage(results[date_type], len(corpus[date_type])))
        print "{} - {}%".format(date_type, percentage(results[date_type], len(corpus[date_type])))
    return int(sum(final_results) / len(corpus))


def evaluate_msg(patterns, verbose=False):
    print "\nFinal Score: {}%".format(evaluate(patterns, verbose))
    return ''
