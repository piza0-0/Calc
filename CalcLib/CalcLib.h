#ifndef CALCLIB_H
#define CALCLIB_H

#include "CalcLib_global.h"

#include <QMap>
#include <QRegularExpression>
#include <stdexcept>

class CALCLIB_EXPORT CalcLib
{
public:
    CalcLib() = default;
    ~CalcLib() = default;

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

#endif // CALCLIB_H
