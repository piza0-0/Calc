#include "CalcLib.h"

double CalcLib::Calculate(const QString &expression)
{
    int currIndex = 0;
    int opIndex = 0;
    double OperandA = 0;
    double OperandB = 0;
    Operator op = operators['+'];

    auto opsKeysList = operators.keys();
    QString opsString;
    for (int i = 0; i < opsKeysList.size(); ++i) {
        if (opsKeysList.at(i) == '^' || opsKeysList.at(i) == '-'){
            opsString.append("\\"); //добавление экранирования для специальных символов регулярного выражения
        }
        opsString.append(opsKeysList.at(i));
    }
    QRegExp regex('['+opsString+']');

    // обработка операндов строки за исключением последнего
    while ((opIndex = expression.indexOf(regex, currIndex)) != (-1))
    {
        OperandB = StringToOperand(expression.mid(currIndex, opIndex - currIndex));
        OperandA = MakeOperation(op, OperandA, OperandB);
        op = operators.value(expression.at(opIndex));
        currIndex = opIndex + 1;
    }

    // обработка последнего операнда строки
    if (currIndex < (expression.size()))
    {
        OperandB = StringToOperand(expression.mid(currIndex, opIndex - currIndex));
        OperandA = MakeOperation(op, OperandA, OperandB);
    }

    return OperandA;

}

double CalcLib::StringToOperand(const QString &str)
{
    if (str.size() == 0)
     {
         return 0;
     }
     double operand;
     bool convIsRight;
     std::string st;
     try
     {
         operand = str.toDouble(&convIsRight);
         if (!convIsRight)
         {
             throw std::logic_error("");
         }
     }
     catch (...)
     {
         throw std::logic_error("Invalid operand");
     }

     return operand;
}

double CalcLib::MakeOperation(const Operator op, const double OperandA, const double OperandB)
{
    switch (op)
    {
        case Operator::ADD:
        {
            return OperandA + OperandB;
        }

        case Operator::SUB:
        {
            return OperandA - OperandB;
        }

        case Operator::MUL:
        {
            return OperandA * OperandB;
        }

        case Operator::DIV:
        {
            if (OperandB == 0)
            {
                throw std::logic_error("Division by zero is prohibited");
            }

            return OperandA / OperandB;
        }

        default:
        {
            throw std::logic_error("Unknown operator");
        }
    }
}


