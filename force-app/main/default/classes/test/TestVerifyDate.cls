@isTest
public with sharing class TestVerifyDate {
    @isTest static void date1GreaterThandate2() {
        Date date1 = date.newInstance(2022, 12, 05);
        Date date2 = date.newInstance(2021, 12, 05);

        Date result = VerifyDate.CheckDates(date1, date2);
        Date expectedResult = date.newInstance(2022, 12, 31);
        System.assertEquals(expectedResult, result, 'ERRORS: Result not true');
    }

    @isTest static void date2Within30day() {
        Date date1 = date.newInstance(2022, 12, 05);
        Date date2 = date.newInstance(2022, 12, 30);

        Date result = VerifyDate.CheckDates(date1, date2);
        System.assertEquals(date2, result, 'ERRORS: Result not true');

    }

    @isTest static void dateGreaterthan30day() {
        Date date1 = date.newInstance(2022, 12, 05);
        Date date2 = date.newInstance(2023, 12, 30);

        Date result = VerifyDate.CheckDates(date1, date2);
        Date expectedResult = date.newInstance(2022, 12, 31);
        System.assertEquals(expectedResult, result, 'ERRORS: Result not true');

    }
}
