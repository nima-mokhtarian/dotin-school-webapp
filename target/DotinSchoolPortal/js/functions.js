$(function () {
    $(".birthDatePicker").persianDatepicker();
});
$(document).ready(function () {
    $('input').bind("paste", function (e) {
        e.preventDefault();
    });
    $('input').on('drop', function(event) {
        event.preventDefault();
    });
    $("input:text.persianTextBox").keypress(function (event) {
        var persianChars = [
            32, 1548, 1563, 1569, 1570, 1574, 1575, 1576, 1578, 1579, 1580, 1581, 1582, 1583, 1584, 1585, 1586, 1587, 1588, 1589, 1590, 1591, 1592, 1593, 1594, 1601, 1602, 1604, 1605, 1606, 1607, 1608, 1610, 1662, 1670, 1688, 1705, 1711, 1740
        ];
        var inputChar = event.which;
        if (persianChars.includes(inputChar))
            return true;
        return false;
    });
    $("input:text.englishTextBox").keypress(function (event) {
        var inputChar = event.which;
        if (inputChar == 32)
            return true;
        if (65 <= inputChar && inputChar <= 90)
            return true;
        if (97 <= inputChar && inputChar <= 122)
            return true;
        return false;
    });
    $("input:text.numberTextBox").keypress(function (event) {
        var inputChar = event.which;
        if (48 <= inputChar && inputChar <= 57)
            return true;
        return false;
    });
});
function checkLoanInputs() {
    var name = document.getElementById("loanNameInput").value;
    var rate = document.getElementById("loanRateInput").value;
    if (name !== "" && rate !== "")
        document.getElementById("loanGrantsDiv").style.display = "block";
    else
        document.getElementById("loanGrantsDiv").style.display = "none";
}

function showLegalContentFA() {
    document.getElementById("fatherCol").style.display = "none";
    document.getElementById("familyCol").style.display = "none";
    document.getElementById("customerCodeLabel").innerHTML = "شماره اقتصادی";
    document.getElementById("customerCodeInput").title = "شماره اقتصادی";
    document.getElementById("customerNameLabel").innerHTML = "نام شرکت";
    document.getElementById("customerNameInput").title = "نام شرکت";
    document.getElementById("customerNameInput").classList.replace("persianTextBox","englishTextBox");
    document.getElementById("customerBirthDateLabel").innerHTML = "تاریخ ثبت";
    document.getElementById("customerBirthDateInput").title = "تاریخ ثبت";
    document.getElementById("customerFamilyInput").value = null;
    document.getElementById("customerFatherInput").value = null;
    document.getElementById("customerFamilyInput").required = false;
    document.getElementById("customerFatherInput").required = false;
}

function showRealContentFA() {
    document.getElementById("fatherCol").style.display = "block";
    document.getElementById("familyCol").style.display = "block";
    document.getElementById("customerCodeLabel").innerHTML = "کد ملی";
    document.getElementById("customerCodeInput").title = "کد ملی";
    document.getElementById("customerNameLabel").innerHTML = "نام";
    document.getElementById("customerNameInput").title = "نام";
    document.getElementById("customerBirthDateLabel").innerHTML = "تاریخ تولد";
    document.getElementById("customerBirthDateInput").title = "تاریخ تولد";
    document.getElementById("customerFamilyInput").required = true;
    document.getElementById("customerFatherInput").required = true;
}

function showLegalContentEN() {
    document.getElementById("fatherCol").style.display = "none";
    document.getElementById("familyCol").style.display = "none";
    document.getElementById("customerCodeLabel").innerHTML = "Economic Code";
    document.getElementById("customerCodeInput").title = "Economic Code";
    document.getElementById("customerNameLabel").innerHTML = "Company Name";
    document.getElementById("customerNameInput").title = "Company Name";
    document.getElementById("customerBirthDateLabel").innerHTML = "Registration Date";
    document.getElementById("customerBirthDateInput").title = "Registration Date";
    document.getElementById("customerFamilyInput").value = null;
    document.getElementById("customerFatherInput").value = null;
    document.getElementById("customerFamilyInput").required = false;
    document.getElementById("customerFatherInput").required = false;
}

function showRealContentEN() {
    document.getElementById("fatherCol").style.display = "block";
    document.getElementById("familyCol").style.display = "block";
    document.getElementById("customerCodeLabel").innerHTML = "National Code";
    document.getElementById("customerCodeInput").title = "National Code";
    document.getElementById("customerNameLabel").innerHTML = "First Name";
    document.getElementById("customerNameInput").title = "First Name";
    document.getElementById("customerBirthDateLabel").innerHTML = "Birth Date";
    document.getElementById("customerBirthDateInput").title = "Birth Date";
    document.getElementById("customerFamilyInput").required = true;
    document.getElementById("customerFatherInput").required = true;
}

function invalidInputFA(inputText) {
    return "لطفا " + inputText + " را وارد نمایید";
}

function invalidInputEN(inputText) {
    return "Please enter " + inputText;
}

function invalidInputCustomerCodeFA(inputText) {
    return inputText + " باید 10 رقم باشد";
}

function invalidInputCustomerCodeEN(inputText) {
    return inputText + " must be 10 digit";
}

function invalidInputDateFA(inputText) {
    return "لطفا ' " + inputText + " ' را طبق فرمت مقابل وارد نمایید: روز/ماه/سال";
}

function invalidInputDateEN(inputText) {
    return "Please enter ' " + inputText + " ' in this format: Month/Day/Year";
}

function validateDateRangeFA() {
    var startInput = document.getElementById("customerBirthdateInputFrom").value;
    var endInput = document.getElementById("customerBirthdateInputTo").value;
    var startDateValues = startInput.split("/");
    var endDateValues = endInput.split("/");
    var start_year = Number(startDateValues[0]);
    var start_month = Number(startDateValues[1]);
    var start_day = Number(startDateValues[2]);
    var end_year = Number(endDateValues[0]);
    var end_month = Number(endDateValues[1]);
    var end_day = Number(endDateValues[2]);
    if (startInput == null || endInput == null)
        return true;
    if (startInput == "" || endInput == "")
        return true;
    if (start_year == end_year && start_month == end_month && start_day == end_day)
        return true;
    if (end_year > start_year)
        return true;
    if (end_year == start_year && end_month > start_month)
        return true;
    if (end_year == start_year && end_month == start_month && end_day > start_day)
        return true;
    alert("بازه ی تاریخ مورد نظر اشتباه است")
    return false;
}

function validateDateRangeEN() {
    var startInput = document.getElementById("customerBirthdateInputFrom").value;
    var endInput = document.getElementById("customerBirthdateInputTo").value;
    var startDateValues = startInput.split("/");
    var endDateValues = endInput.split("/");
    var start_year = Number(startDateValues[0]);
    var start_month = Number(startDateValues[1]);
    var start_day = Number(startDateValues[2]);
    var end_year = Number(endDateValues[0]);
    var end_month = Number(endDateValues[1]);
    var end_day = Number(endDateValues[2]);
    if (startInput == null || endInput == null)
        return true;
    if (startInput == "" || endInput == "")
        return true;
    if (start_year == end_year && start_month == end_month && start_day == end_day)
        return true;
    if (end_year > start_year)
        return true;
    if (end_year == start_year && end_month > start_month)
        return true;
    if (end_year == start_year && end_month == start_month && end_day > start_day)
        return true;
    alert("' Date From ' must be less than ' Date To '")
    return false;
}

function validateNationalCodeForInsertFA() {
    if(document.getElementById("real").checked) {
        var nationalCode = document.getElementById("customerCodeInput").value;
        var sumOfDigits = (nationalCode[0] * 10) + (nationalCode[1] * 9) + (nationalCode[2] * 8) + (nationalCode[3] * 7) + (nationalCode[4] * 6) + (nationalCode[5] * 5) + (nationalCode[6] * 4) + (nationalCode[7] * 3) + (nationalCode[8] * 2);
        var validCode = false;
        var remainder = sumOfDigits % 11;
        if (remainder === nationalCode[9])
            return true;
        if (remainder === 11 - nationalCode[9])
            return true;
   alert("کد ملی وارد شده صحیح نمی باشد");
   return false;
    }
    return true;
}

function validateNationalCodeForInsertEN() {
    if(document.getElementById("real").checked) {
        var nationalCode = document.getElementById("customerCodeInput").value;
        var sumOfDigits = (nationalCode[0] * 10) + (nationalCode[1] * 9) + (nationalCode[2] * 8) + (nationalCode[3] * 7) + (nationalCode[4] * 6) + (nationalCode[5] * 5) + (nationalCode[6] * 4) + (nationalCode[7] * 3) + (nationalCode[8] * 2);
        var validCode = false;
        var remainder = sumOfDigits % 11;
        if (remainder === nationalCode[9])
            return true;
        if (remainder === 11 - nationalCode[9])
            return true;
        alert("National Code is incorrect");
        return false;
    }
    return true;
}

function validateNationalCodeForUpdateFA() {
    if(document.getElementById("customerType").value==='true') {
        var nationalCode = document.getElementById("customerCodeInput").value;
        var sumOfDigits = (nationalCode[0] * 10) + (nationalCode[1] * 9) + (nationalCode[2] * 8) + (nationalCode[3] * 7) + (nationalCode[4] * 6) + (nationalCode[5] * 5) + (nationalCode[6] * 4) + (nationalCode[7] * 3) + (nationalCode[8] * 2);
        var validCode = false;
        var remainder = sumOfDigits % 11;
        if (remainder === nationalCode[9])
            return true;
        if (remainder === 11 - nationalCode[9])
            return true;
        alert("کد ملی وارد شده صحیح نمی باشد");
        return false;
    }
    return true;
}

function validateNationalCodeForUpdateEN() {
    if(document.getElementById("customerType").value==='true') {
        var nationalCode = document.getElementById("customerCodeInput").value;
        var sumOfDigits = (nationalCode[0] * 10) + (nationalCode[1] * 9) + (nationalCode[2] * 8) + (nationalCode[3] * 7) + (nationalCode[4] * 6) + (nationalCode[5] * 5) + (nationalCode[6] * 4) + (nationalCode[7] * 3) + (nationalCode[8] * 2);
        var validCode = false;
        var remainder = sumOfDigits % 11;
        if (remainder === nationalCode[9])
            return true;
        if (remainder === 11 - nationalCode[9])
            return true;
        alert("National Code is incorrect");
        return false;
    }
    return true;
}

function validateGrantRangeFA() {
    var minimumAmount = Number(document.getElementById("minimumAmountInput").value);
    var maximumAmount = Number(document.getElementById("maximumAmountInput").value);
    var minimumDuration = Number(document.getElementById("minimumDurationInput").value);
    var maximumDuration = Number(document.getElementById("maximumDurationInput").value);
    if (minimumAmount == 0 || maximumAmount == 0) {
        alert("مبلغ قرار داد نباید صفر باشد");
        return false;
    }
    if (minimumDuration == 0 || maximumDuration == 0) {
        alert("مدت قرار داد نباید صفر باشد");
        return false;
    }
    if (minimumAmount>maximumAmount) {
        alert("حداکثر مبلغ قرار داد نباید کمتر از حداقل مبلغ قرار باشد");
        return false;
    }
    if (minimumDuration>maximumDuration) {
        alert("حداکثر مدت قرار داد نباید کمتر از حداقل مدت قرار باشد");
        return false;
    }
    return true;
}

function validateGrantRangeEN() {
    var minimumDuration = Number(document.getElementById("minimumDurationInput").value);
    var maximumDuration = Number(document.getElementById("maximumDurationInput").value);
    var minimumAmount = Number(document.getElementById("minimumAmountInput").value);
    var maximumAmount = Number(document.getElementById("maximumAmountInput").value);
    if (minimumAmount == 0 || maximumAmount == 0)
        return false;
    if (minimumDuration>maximumDuration) {
        alert("Maximum Duration should not be less than Minimum Duration");
        return false;
    }
    if (minimumAmount>maximumAmount) {
        alert("Maximum Amount should not be less than Minimum Amount");
        return false;
    }
    return true;
}

function showLegalContentForFindFA() {
    document.getElementById("customerFamilyField").style.display = "none";
    document.getElementById("customerCodeLabel").innerHTML = "شماره اقتصادی";
    document.getElementById("customerCodeInput").title = "شماره اقتصادی";
    document.getElementById("customerNameLabel").innerHTML = "نام شرکت";
    document.getElementById("customerNameInput").title = "نام شرکت";
    document.getElementById("customerBirthDateLabelFrom").innerHTML = "تاریخ ثبت از";
    document.getElementById("customerBirthDateInputFrom").title = "تاریخ ثبت از";
    document.getElementById("customerBirthDateLabelTo").innerHTML = "تاریخ ثبت تا";
    document.getElementById("customerBirthDateInputTo").title = "تاریخ ثبت تا";
    document.getElementById("customerFamilyInput").value = null;
}

function showRealContentForFindFA() {
    document.getElementById("customerFamilyField").style.display = "block";
    document.getElementById("customerCodeLabel").innerHTML = "کد ملی";
    document.getElementById("customerCodeInput").title = "کد ملی";
    document.getElementById("customerNameLabel").innerHTML = "نام";
    document.getElementById("customerNameInput").title = "نام";
    document.getElementById("customerBirthDateLabelFrom").innerHTML = "تاریخ تولد از";
    document.getElementById("customerBirthDateInputFrom").title = "تاریخ تولد از";
    document.getElementById("customerBirthDateLabelTo").innerHTML = "تاریخ تولد تا";
    document.getElementById("customerBirthDateInputTo").title = "تاریخ تولد تا";
}

function showLegalContentForFindEN() {
    document.getElementById("customerFamilyField").style.display = "none";
    document.getElementById("customerCodeLabel").innerHTML = "Economic Code";
    document.getElementById("customerCodeInput").title = "Economic Code";
    document.getElementById("customerNameLabel").innerHTML = "Company Name";
    document.getElementById("customerNameInput").title = "Company Name";
    document.getElementById("customerBirthDateLabelFrom").innerHTML = "Registration Date From";
    document.getElementById("customerBirthDateInputFrom").title = "Registration Date From";
    document.getElementById("customerBirthDateLabelTo").innerHTML = "Registration Date To";
    document.getElementById("customerBirthDateInputTo").title = "Registration Date To";
    document.getElementById("customerFamilyInput").value = null;
}

function showRealContentForFindEN() {
    document.getElementById("customerFamilyField").style.display = "block";
    document.getElementById("customerCodeLabel").innerHTML = "National Code";
    document.getElementById("customerCodeInput").title = "National Code";
    document.getElementById("customerNameLabel").innerHTML = "First Name";
    document.getElementById("customerNameInput").title = "First Name";
    document.getElementById("customerBirthDateLabelFrom").innerHTML = "Birth Date From";
    document.getElementById("customerBirthDateInputFrom").title = "Birth Date From";
    document.getElementById("customerBirthDateLabelTo").innerHTML = "Birth Date To";
    document.getElementById("customerBirthDateInputFrom").title = "Birth Date From";
}

function changeLanguageToPersian() {
    document.languageForm.selectedLanguage.value = "Persian";
    document.languageForm.submit();
}

function changeLanguageToEnglish() {
    document.languageForm.selectedLanguage.value = "English";
    document.languageForm.submit();
}

function showCustomerForLoan() {
    document.getElementById("customerInformationDiv").style.display = "block";
    document.getElementById("loanFileDiv").style.display = "block";
}
