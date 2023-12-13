<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Zhang Xin
  Date: 2023/12/9 0009
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Personal Dashboard</title>
    <%@ include file="../components/htmlhead.jsp" %>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<c:url value="/static/css/modifyInfo.css"/>">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>

<body>
<%@ include file="../components/header.jsp" %>
<div class="panel" id="panel">
    <div class="panel-left">
        <p></p>
        <%--    先随便放张图--%>
        <div class="self_information">
            <c:if test="${sessionScope.student.img!=null}">
                <img src="${pageContext.request.contextPath}/static/images/avatar/${sessionScope.student.studentNo}.jpg"
                     alt=" " class="avatar rounded-circle mx-auto d-block">
            </c:if>
            <c:if test="${sessionScope.student.img==null}">
                <img src="${pageContext.request.contextPath}/static/images/avatar/nwpu.jpg"
                     alt=" " class="avatar rounded-circle mx-auto d-block">
                <div class="avatar overlay rounded-circle">
                    <input type="file" accept="image/*" id="imageInput" style="display: none;">
                    <button class="avatar-button rounded-3" onclick="uploadImage()">上传图像
                    </button>
                    <script>
                        function uploadImage() {
                            document.getElementById('imageInput').click();
                        }

                        document.getElementById('imageInput').addEventListener('change', function () {
                            var selectedFile = this.files[0];
                            if (selectedFile) {
                                var formData = new FormData();
                                formData.append('image', selectedFile);
                                console.log('Selected file:', selectedFile);
                            }
                        });
                    </script>
                </div>
            </c:if>
        </div>
        <p></p>
        <h3 class="name">${sessionScope.student.name}</h3>
        <h3 class="name">ZhangSan</h3>
        <div class="options">
            <button class="btn btn-option active" onclick="showPersonalInfo()" data-target="personalInfo">个人信息修改
            </button>
            <button class="btn btn-option" onclick="logout()" data-target="logout">Logout</button>
            <button class="btn btn-option" onclick="function showOther() {
            // 暂时不知道写啥，放着先，目前可以按键更改样式
            }
            showOther()" data-target="other">其他
            </button>
        </div>
    </div>
    <div class="panel-right" id="panelRight">
        <!-- Right panel content will be dynamically filled -->
        <!-- 在这里添加一个隐藏的表单，用于提交修改后的个人信息 -->
        <%--        <form id="updateUserInfoForm" style="display:none;">--%>
        <%--            <input type="hidden" id="updatedStudentNo" name="studentNo">--%>
        <%--            <input type="hidden" id="updatedUserName" name="userName">--%>
        <%--            <input type="hidden" id="updatedWechat" name="wechat">--%>
        <%--            <input type="hidden" id="updatedPhone" name="phone">--%>
        <%--            <input type="hidden" id="updatedEmail" name="email">--%>
        <%--            <!-- 添加其他需要更新的字段，如wechat、phone、email等 -->--%>
        <%--            <button type="submit" id="submitUpdateUserInfo"></button>--%>
        <%--        </form>--%>
    </div>
</div>
<!-- footer -->
<%@include file="/WEB-INF/views/components/footer.jsp" %>
<!-- //footer -->
<!-- Bootstrap JS and jQuery Slim JS -->
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
<%--<script src="<c:url value="/static/js/modifyInfo.js"/>"></script>--%>
<script>
    // 这里只是简单实现了跳转到登录界面可重新登陆，但是实际并没有退出，后端逻辑需要进行修改，在退出后消除记录
    function logout() {
        fetch('/logout', {
            method: 'POST',
            credentials: 'same-origin'
        })
            .then(response => {
                if (response.ok) {
                    window.location.href = '/login';
                } else {
                    console.error('Logout failed');
                }
            })
            .catch(error => {
                console.error('Error during logout:', error);
            });
    }

    // 在右侧面板展示用户信息 这里直接写死了，需要和数据库进行连接
    function showPersonalInfo() {
        // 获取 panelRight 元素
        const panelRight = document.getElementById('panelRight');
        // 清空右侧内容
        panelRight.innerHTML = '';
        // 创建个人信息修改表单
        const personalInfoForm = document.createElement('form');
        personalInfoForm.id = 'personalInfoForm';
        personalInfoForm.className = 'm-auto p-4 bg-light rounded';

        // 添加学号信息（不可编辑）
        const studentIdInputGroup = createNonEditableInput('学号', 'studentId', '123456');
        personalInfoForm.appendChild(studentIdInputGroup);

        // 添加姓名输入框及修改按钮
        const nameInputGroup = createEditableInputWithIcon('姓名', 'firstName', '张三', 'bi-pencil');
        personalInfoForm.appendChild(nameInputGroup);

        // 添加年龄输入框及修改按钮
        const ageInputGroup = createEditableInputWithIcon('年龄', 'age', '25', 'bi-pencil');
        personalInfoForm.appendChild(ageInputGroup);

        // 添加学院输入框及修改按钮
        const collegeInputGroup = createEditableInputWithIcon('学院', 'college', '软件学院', 'bi-pencil');
        personalInfoForm.appendChild(collegeInputGroup);

        // 添加班级输入框及修改按钮
        const classInputGroup = createEditableInputWithIcon('班级', 'class', '140121xx', 'bi-pencil');
        personalInfoForm.appendChild(classInputGroup);

        // 添加电话输入框及修改按钮
        const phoneInputGroup = createEditableInputWithIcon('电话', 'phone', '1234567890', 'bi-pencil');
        personalInfoForm.appendChild(phoneInputGroup);

        // 添加提交按钮
        const submitBtn = document.createElement('button');
        submitBtn.type = 'submit';
        submitBtn.className = 'btn btn-primary mt-3';
        submitBtn.innerText = '提交';
        submitBtn.addEventListener('click', function (e) {
            e.preventDefault();
            handleSaveClick();
        });
        personalInfoForm.appendChild(submitBtn);

        // 将个人信息修改表单添加到右侧面板
        panelRight.appendChild(personalInfoForm);

        // 更新按钮的选中状态
        updateButtonState('个人信息修改');
    }

    // 学号这种主键不能动
    // 创建不可编辑的输入框
    function createNonEditableInput(labelText, inputId, value) {
        const formGroup = document.createElement('div');
        formGroup.className = 'form-group';

        const inputGroup = document.createElement('div');
        inputGroup.className = 'input-group';

        // 添加标签名
        const label = document.createElement('label');
        label.innerText = labelText;
        label.className = 'input-group-text';

        // 添加输入框
        const input = document.createElement('input');
        input.type = 'text';
        input.className = 'form-control';
        input.id = inputId;
        input.value = value;
        input.readOnly = true; // 设置为只读

        // 添加输入框和图标按钮到输入组
        inputGroup.appendChild(label);
        inputGroup.appendChild(input);

        // 添加输入组到表单组
        formGroup.appendChild(inputGroup);

        return formGroup;
    }

    // bootstrap框架引入有些问题，不能显示，但在文件下载后的情况测试是可以正常显示的
    // 创建图标按钮
    function createIconButton(iconClass, clickHandler) {
        const button = document.createElement('button');
        button.type = 'button';
        button.className = 'btn btn-outline-secondary bi-btn';
        button.addEventListener('click', clickHandler);

        const icon = document.createElement('i');
        icon.className = `bi ${iconClass}`;

        button.appendChild(icon);

        return button;
    }

    // 创建带图标的可编辑输入框
    function createEditableInputWithIcon(labelText, inputId, value, iconClass) {
        const formGroup = document.createElement('div');
        formGroup.className = 'form-group';

        const inputGroup = document.createElement('div');
        inputGroup.className = 'input-group';

        // 添加标签名
        const label = document.createElement('label');
        label.innerText = labelText;
        label.className = 'input-group-text';

        // 添加输入框
        const input = document.createElement('input');
        input.type = 'text';
        input.className = 'form-control';
        input.id = inputId;
        input.value = value;
        input.readOnly = true;

        // 添加编辑按钮
        const editBtn = createIconButton(iconClass, function () {
            handleEditClick(inputId);
        });

        // 添加保存按钮
        const saveBtn = createIconButton('bi-check-circle', function () {
            handleSaveClick();
        });
        saveBtn.style.display = 'none'; // 初始状态下隐藏保存按钮

        // 添加输入框和图标按钮到输入组
        inputGroup.appendChild(label);
        inputGroup.appendChild(input);
        inputGroup.appendChild(editBtn);
        inputGroup.appendChild(saveBtn);

        // 添加输入组到表单组
        formGroup.appendChild(inputGroup);

        return formGroup;
    }

    // 处理编辑按钮点击事件
    function handleEditClick(inputId) {
        const input = document.getElementById(inputId);
        input.readOnly = false;
        // 切换显示编辑按钮和保存按钮
        toggleEditSaveButtons(inputId, true);
    }

    // 处理保存按钮点击事件
    function handleSaveClick() {
        // 在这里添加保存信息的逻辑，可以将信息发送到服务器或本地存储
        // 示例中只是在控制台输出修改后的信息
        const firstName = document.getElementById('firstName').value;
        const age = document.getElementById('age').value;
        const college = document.getElementById('college').value;
        const className = document.getElementById('class').value;
        const phone = document.getElementById('phone').value;

        console.log(`姓名: ${firstName}, 年龄: ${age}, 学院: ${college}, 班级: ${className}, 电话: ${phone}`);

        // 切换显示编辑按钮和保存按钮
        toggleEditSaveButtons('firstName', false);
        toggleEditSaveButtons('age', false);
        toggleEditSaveButtons('college', false);
        toggleEditSaveButtons('class', false);
        toggleEditSaveButtons('phone', false);
    }

    // 切换编辑按钮和保存按钮的显示状态
    function toggleEditSaveButtons(inputId, isEditing) {
        const editBtn = document.getElementById(inputId).nextElementSibling;
        const saveBtn = editBtn.nextElementSibling;

        if (isEditing) {
            editBtn.style.display = 'none';
            saveBtn.style.display = 'block';
        } else {
            editBtn.style.display = 'block';
            saveBtn.style.display = 'none';
        }
    }

</script>
</body>

</html>
