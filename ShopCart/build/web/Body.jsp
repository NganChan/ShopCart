<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.FileReader"%>
<%
    JSONParser parser = new JSONParser();

    try (FileReader reader = new FileReader("C:\\Users\\acer\\Documents\\1Proj\\Java\\Net\\BT\\ShopCart\\web\\Data.json")) {
        JSONArray userList = (JSONArray) parser.parse(reader);
%>

<div class="page-body">
      <p>Home / Shop / My Wishlist</p>
      <h1>My Wishlist</h1>
      <p>There are 5 products in this wishlist.</p>

      <div class="product-table_cover">
        <table class="product-table">
          <tr class="first-line">
            <th> <input type="checkbox"></th>
            <th></th>
            <th>Product</th>
            <th>Amount</th>
            <th>Status</th>
            <th>Actions</th>
            <th>Remove</th>
          </tr>
          <% for (Object obj : userList) { %>
            <% JSONObject user = (JSONObject) obj; %>
            <tr>
                <td><input type="checkbox"></td>
                <td><img class ="productImg" src="<%= user.get("img") %>" alt=""></td>
                <td><%= user.get("productName") %></td>
                <td><%= user.get("productPrice") %></td>
                <td>In Stock</td>
                <td>Add to Cart</td>
                <td><ion-icon name="trash-outline"></ion-icon></td>
            </tr>
          <% } %>
        </table>
      </div>

    </div>

<%
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
