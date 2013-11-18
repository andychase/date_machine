        parser_description = [{"regex": "(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?.?,?\\s)?(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))\\s(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:([12][0-9]{3}|[09][0-9])))?", "tree": [12, "ReverseBasicText", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]]]], "order": 2}, {"regex": "(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))\\s?-\\s?(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))", "tree": [6, "MonthRange", [[2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]]]], "order": 6}, {"regex": "(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))(?:\\sat\\s|,\\s|:\\s)(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))", "tree": [8, "_default", [[1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]]]], "order": 1}, {"regex": "(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?", "tree": [3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], "order": 1}, {"regex": "(?:(?:(1[0-2]|[0]?[1-9])))\\/(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))\\/(?:(?:([12][0-9]{3}|[09][0-9])))\\s?-?\\s?(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?", "tree": [11, "Slash", [[1, "MonthNum", [[1, "Chase Month", [[1, "MonthNum", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]]]], "order": 5}, {"regex": "(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s?(?:(?:([0]?[1-9]|1[0-2])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?\\s(?:and|\\&)\\s([0]?[1-9]|1[0-2])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?))\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))-(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s(?:(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))\\s?-\\s?(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9]))))", "tree": [22, "WeekdayRangeWithExtraBackwards", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [6, "_default_type", [[6, "Steve Valaitis And Time", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [6, "MonthRange", [[2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]]]]]], "order": 10}, {"regex": "(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))(?:\\sand\\s(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm))))?\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))-(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s?(?:(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))\\s?-\\s?(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9]))))", "tree": [22, "WeekdayRangeWithTime", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [6, "MonthRange", [[2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]]]]]], "order": 7}, {"regex": "(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))(?:\\sand\\s(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm))))?\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))-(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))\\sand\\s(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s(?:(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))\\s?-\\s?(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9]))))", "tree": [30, "WeekdayRangeWithExtra", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [6, "MonthRange", [[2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]]]]]], "order": 9}, {"regex": "(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm))),?\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))", "tree": [8, "_default", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], "order": 1}, {"regex": "(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?.?,?\\s)?(?:(?:(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?).?,?\\s?)?(?:(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s)?(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))[.,\\s]?(?:(?:([12][0-9]{3}|[09][0-9])))?", "tree": [16, "BasicText", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]]]], "order": 3}, {"regex": "(?:(?:(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?).?,?\\s?)?(?:(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s)?(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))[.,\\s]?(?:(?:([12][0-9]{3}|[09][0-9])))?\\s?(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))\\s?-\\s?(?:(?:(?:([0-9]|[1][0-2])))|(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm))))", "tree": [24, "AltTimeRange", [[3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]]]], "order": 9}, {"regex": "(?:(?:(?:([0-9]|[1][0-2])))|(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm))))\\s?-\\s?(?:(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?.?,?\\s)?(?:(?:(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?).?,?\\s?)?(?:(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s)?(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))[.,\\s]?(?:(?:([12][0-9]{3}|[09][0-9])))?)", "tree": [24, "TimeRange", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [16, "BasicText", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]]]]]], "order": 9}, {"regex": "(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))\\-(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))(?:\\sand\\s(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm))))?\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))-(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s?(?:(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))\\s?-\\s?(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))))", "tree": [29, "WeekdayRangeWithTimeRange", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [22, "WeekdayRangeWithTime", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [6, "MonthRange", [[2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]]]]]]]], "order": 10}, {"regex": "(?:(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?.?,?\\s)?(?:(?:(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?).?,?\\s?)?(?:(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s)?(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))[.,\\s]?(?:(?:([12][0-9]{3}|[09][0-9])))?)\\suntil\\s(?:(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?.?,?\\s)?(?:(?:(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?).?,?\\s?)?(?:(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s)?(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))[.,\\s]?(?:(?:([12][0-9]{3}|[09][0-9])))?)", "tree": [32, "UntilRange", [[16, "BasicText", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]]]], [16, "BasicText", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]]]]]], "order": 11}, {"regex": "(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?\\s(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s(?:-(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s)?\\sthrough\\s(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9]))).?,?\\s(?:(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?.?,?\\s)?(?:(?:(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?).?,?\\s?)?(?:(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s)?(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))[.,\\s]?(?:(?:([12][0-9]{3}|[09][0-9])))?)", "tree": [29, "ThroughRange", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [16, "BasicText", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]]]]]], "order": 12}, {"regex": "(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))\\sand\\s(?:(?:(?:(?:([0]?[1-9]|1[0-2])[:\\.]([0-5][0-9])(?:[:\\.]([0-5][0-9]))?\\s?(am|pm)?)|(?:(Noon|Midnight))|(?:([0-9]|[1][0-2])\\s?(am|pm)))?.?,?\\s)?(?:(?:(?:every\\s)?(?:(?:(First|Second|Third|Fou?rth)))?(?:\\sand\\s(?:(?:(First|Second|Third|Fou?rth))))?\\s?(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?))s?,?\\s?(?:\\s?of\\sthe\\s(?:month|week))?).?,?\\s?)?(?:(?:(?:((?:Sun|Mon|(?:T(?:ues|hurs))|Fri)(?:day|\\.)?|Wed(?:\\.|nesday)?|Sat(?:\\.|urday)?|T(?:(?:ue?)|(?:hu?r?)))\\.?)),?\\s)?(?:(?:(J(?:anuary|u(?:ne|ly))|February|Ma(?:rch|y)|A(?:pril|ugust)|(?:(?:(?:Sept|Nov|Dec)em)|Octo)ber))|(?:(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sept?|Oct|Nov|Dec).?))\\s(?:(?:(3[0-2]|[0-2]?[0-9])(th|rd|st|nd)?(?![0-9])))[.,\\s]?(?:(?:([12][0-9]{3}|[09][0-9])))?)", "tree": [23, "MultiTime", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [16, "BasicText", [[7, "_default_type", [[4, "Steve Valaitis", [[1, "_default_group", []], [1, "_default_group", []], [1, "_default_group", []], [1, "AMPM", []]]], [1, "Text Parts", [[1, "_default_group", []]]], [2, "Greg Burns", [[1, "_default_group", []], [1, "AMPM", []]]]]], [3, "LargeRepeatWords", [[1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "_default", [[1, "_default_group", []]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]]]], [1, "_default_type", [[1, "Michael Ash10", [[1, "_default_group", []]]]]], [2, "Month", [[1, "_default", [[1, "MonthString", []]]], [1, "_default", [[1, "MonthString", []]]]]], [2, "_default_type", [[2, "Chase Date", [[1, "_default_group", []], [1, "_default_group", []]]]]], [1, "_default_type", [[1, "Chase Year", [[1, "_default_group", []]]]]]]]]], "order": 4}];