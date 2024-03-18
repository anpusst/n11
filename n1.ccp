#include <iostream>
#include <string>
#include <locale>
#include <codecvt>
#include <cctype>

using namespace std;

int calculateArithmeticExpression(const string& expression) {
    int result = 0;
    char operation = '+';
    int num = 0;
    bool isNum = false;

    for (char c : expression) {
        if (isdigit(c)) {
            num = num * 10 + (c - '0');
            isNum = true;
        } else if (c == '+' || c == '-') {
            if (!isNum) {
                cout << "Ошибка: некорректное выражение\n";
                return 0;
            }

            if (operation == '+') {
                result += num;
            } else {
                result -= num;
            }

            num = 0;
            operation = c;
            isNum = false;
        } else {
            cout << "Ошибка: некорректные символы в выражении\n";
            return 0;
        }
    }

    if (!isNum) {
        cout << "Ошибка: некорректное выражение\n";
        return 0;
    }

    if (operation == '+') {
        result += num;
    } else {
        result -= num;
    }

    return result;
}

int main() {
    locale::global(locale("ru_RU.UTF-8"));
    wstring_convert<codecvt_utf8<wchar_t>> converter;

    string expression;
    cout << "Введите арифметическое выражение: ";
    getline(cin, expression);

    int result = calculateArithmeticExpression(expression);
    if (result != 0) {
        cout << "Результат вычисления: " << result << endl;
    }

    return 0;
}
