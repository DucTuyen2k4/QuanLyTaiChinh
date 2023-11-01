<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
 <title>simple calculator</title>

</head>
<body>
<form action="/hello-servlet" method="get">
    <table>
        <tr>
            <th><label>First number:</label></th>
            <th><input type="text" name="number1" placeholder="number 1"></th>
        </tr>
        <tr>
            <th>
                <label>Option</label>
            </th>
            <th>
                <select name="Calculator">
                    <option value="cong">cong</option>
                    <option value="tru">tru</option>
                    <option value="nhan">nhan</option>
                    <option value="chia">chia</option>
                </select>
            </th>
        </tr>
        <tr>
            <th>
            <label>Second number:</label>
            </th>
            <th>
                <input type="text" name="number2" placeholder="number 2">
            </th>
        </tr>
        <tr>
            <th>
                <label></label>
            </th>
            <th>
                <input type="submit" value="ket qua">
            </th>
        </tr>
    </table>
</form>
</body>
</html>