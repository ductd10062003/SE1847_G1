<%-- 
    Document   : test_category
    Created on : 29 May 2024, 22:39:00
    Author     : DAT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<div class="row">
    <div>
        <div class="card">
            <div class="card-header">Category</div>
            <div class="card-body">
                <div>
                    <form action="testCategory" method="POST">
                        <div id="list_categories">
                            <c:forEach items="${requestScope.category}" var="category">
                                <div class="form-check">
                                    <input
                                        required
                                        class="form-check-input"
                                        type="radio"
                                        name="category"                                            
                                        value="${category.category_id}"
                                        onclick="changeCategory()"
                                        />
                                    <label
                                        class="form-check-label"
                                        for="category"
                                        >
                                        ${category.category_name}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                        <input type="hidden" name="data_flashcards" id="data_flashcards"/>
                        <input type="hidden" name="category_id" id="data_category_id"/>
                        <input type="hidden" name="service" value="createFlashCard" />
                    </form>
                </div>                             
            </div>
        </div>
    </div>
</div>

