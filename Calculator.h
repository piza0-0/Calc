#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QMap>
#include <QRegularExpression>
#include <stdexcept>

class Calculator
{
public:
    Calculator() = default;
    ~Calculator() = default;

    double Calculate(const QString& expression);
private:
    enum class Operator
    {
        ADD,
        SUB,
        MUL,
        DIV
    };

    QMap<QChar, Operator> operators =
    {
        { '+' , Operator::ADD },
        { '-' , Operator::SUB },
        { '*' , Operator::MUL },
        { '/' , Operator::DIV }
    };

    double StringToOperand(const QString& str);
    double MakeOperation(const Operator op,
                         const double OperandA, const double OperandB);
};

#endif // CALCULATOR_H
