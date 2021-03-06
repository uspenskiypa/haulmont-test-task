<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Credit Proposals</title>
    <link rel="stylesheet" href="webjars/bootstrap/4.5.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="webjars/noty/3.1.4/demo/font-awesome/css/font-awesome.min.css">
</head>
<body>

<section>
    <h3><a href="/">Домой</a></h3>
    <hr/>
    <div class="container">
        <h2>Кредитные предложения</h2>
        <br>
        <form action="creditProposalCreate">
            <button class="btn btn-primary" type="submit">
                <span class="fa fa-plus"></span>
                Составление кредитного предложения
            </button>
        </form>
        <table border="1" cellpadding="8" cellspacing="0">
            <thead>
            <tr>
                <th>ФИО клиента</th>
                <th>Процентная ставка</th>
                <th>Сумма кредита</th>
                <th>График платежей</th>
                <th></th>
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${creditProposals}" var="creditProposal">
                <jsp:useBean id="creditProposal" type="com.haulmont.testtask.model.CreditProposal"/>
                <tr>
                    <td>${creditProposal.customer.fio}</td>
                    <td>${creditProposal.credit.interestRate}</td>
                    <td>${creditProposal.creditAmount}</td>
                    <td><a href="paymentsByCreditProposal?creditProposalId=${creditProposal.id}">График платежей</a>
                    </td>
                    <td><a href="#"><span class="fa fa-pencil"></span></a></td>
                    <td><a href="creditProposals/delete?id=${creditProposal.id}"><span class="fa fa-remove"></span></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
</section>
</div>
</body>
</html>
