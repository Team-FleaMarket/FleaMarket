let currentActiveButton = null;

function updateButtonState(target) {
    const buttons = document.querySelectorAll('.btn-option');
    buttons.forEach(button => {
        button.classList.remove('active');
        if (button.getAttribute('data-target') === target) {
            button.classList.add('active');
        }
    });
    currentActiveButton = target;
}

// function showPersonalInfo() {
//     // 获取 panelRight 元素
//     const panelRight = document.getElementById('panelRight');
//     // 清空右侧内容
//     panelRight.innerHTML = '';
//     // 创建个人信息修改表单
//     const personalInfoForm = document.createElement('form');
//     personalInfoForm.id = 'personalInfoForm';
//     personalInfoForm.className = 'm-auto p-4 bg-light rounded';
//     // 添加学号信息（不可编辑）
//     const studentIdInputGroup = createNonEditableInput('学号', 'studentId', '123456');
//     personalInfoForm.appendChild(studentIdInputGroup);
//     // 添加姓名输入框及修改按钮
//     const nameInputGroup = createEditableInputWithIcon('姓名', 'firstName', '张三', 'bi-pencil');
//     personalInfoForm.appendChild(nameInputGroup);
//     // 添加年龄输入框及修改按钮
//     const ageInputGroup = createEditableInputWithIcon('年龄', 'age', '25', 'bi-pencil');
//     personalInfoForm.appendChild(ageInputGroup);
//     // 添加学院输入框及修改按钮
//     const collegeInputGroup = createEditableInputWithIcon('学院', 'college', '软件学院', 'bi-pencil');
//     personalInfoForm.appendChild(collegeInputGroup);
//     // 添加班级输入框及修改按钮
//     const classInputGroup = createEditableInputWithIcon('班级', 'class', '140121xx', 'bi-pencil');
//     personalInfoForm.appendChild(classInputGroup);
//     // 添加电话输入框及修改按钮
//     const phoneInputGroup = createEditableInputWithIcon('电话', 'phone', '1234567890', 'bi-pencil');
//     personalInfoForm.appendChild(phoneInputGroup);
//     // 添加提交按钮
//     const submitBtn = document.createElement('button');
//     submitBtn.type = 'submit';
//     submitBtn.className = 'btn btn-primary mt-3';
//     submitBtn.innerText = '提交';
//     submitBtn.addEventListener('click', function (e) {
//         e.preventDefault();
//         handleSaveClick();
//     });
//     personalInfoForm.appendChild(submitBtn);
//     // 将个人信息修改表单添加到右侧面板
//     panelRight.appendChild(personalInfoForm);
//     // 更新按钮的选中状态
//     updateButtonState('个人信息修改');
// }

function showPersonalInfo() {
    const panelRight = document.getElementById('panelRight');
    panelRight.innerHTML = '';

    // 调用函数从数据库获取用户信息
    fetchUserInfoFromDatabase().then(userInfo => {
        // 创建个人信息修改表单
        const personalInfoForm = createPersonalInfoForm(userInfo);
        // 将个人信息修改表单添加到右侧面板
        panelRight.appendChild(personalInfoForm);
        // 更新按钮的选中状态
        updateButtonState('personalInfo');
    });
}
function createPersonalInfoForm(userInfo) {
    const personalInfoForm = document.createElement('form');
    personalInfoForm.id = 'personalInfoForm';
    personalInfoForm.className = 'm-auto p-4 bg-light rounded';

    // 添加学号信息（不可编辑）
    const studentIdInputGroup = createNonEditableInput('学号', 'studentId', userInfo.studentNo);
    personalInfoForm.appendChild(studentIdInputGroup);

    // 添加姓名输入框及修改按钮
    const nameInputGroup = createEditableInputWithIcon('姓名', 'userName', userInfo.userName, 'bi-pencil');
    personalInfoForm.appendChild(nameInputGroup);

    // 添加其他需要更新的字段，如wechat、phone、email等
    const wechatInputGroup = createEditableInputWithIcon('微信', 'wechat', userInfo.wechat, 'bi-pencil');
    personalInfoForm.appendChild(wechatInputGroup);

    const phoneInputGroup = createEditableInputWithIcon('电话', 'phone', userInfo.phone, 'bi-pencil');
    personalInfoForm.appendChild(phoneInputGroup);

    const emailInputGroup = createEditableInputWithIcon('邮箱', 'email', userInfo.email, 'bi-pencil');
    personalInfoForm.appendChild(emailInputGroup);

    // 添加提交按钮
    const submitBtn = document.createElement('button');
    submitBtn.type = 'submit';
    submitBtn.className = 'btn btn-primary mt-3';
    submitBtn.innerText = '提交';
    submitBtn.addEventListener('click', function (e) {
        e.preventDefault();
        handleSaveClick(userInfo.studentNo);
    });
    personalInfoForm.appendChild(submitBtn);

    return personalInfoForm;
}
function handleSaveClick(studentNo) {
    // 获取修改后的个人信息 学号无法修改
    const updatedUserName = document.getElementById('userName').value;
    const updatedWechat = document.getElementById('wechat').value;
    const updatedEmail = document.getElementById('email').value;
    const updatedPhone = document.getElementById('phone').value;

    // 将修改后的个人信息提交到后端
    submitUpdatedUserInfo(studentNo, updatedUserName, updatedWechat, updatedEmail, updatedPhone);

    // 切换显示编辑按钮和保存按钮
    toggleEditSaveButtons('userName', false);
    toggleEditSaveButtons('wechat', false);
    toggleEditSaveButtons('email', false);
    toggleEditSaveButtons('phone', false);
}
function submitUpdatedUserInfo(studentNo, updatedUserName, updatedWechat, updatedEmail, updatedPhone) {
    // 更新后端接口路径，替换为实际的后端接口
    const apiUrl = `${contextPath}/api/updateuserinfo`;
    // 提交数据到后端
    fetch(apiUrl, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            studentNo: studentNo,
            userName: updatedUserName,
            wechat: updatedWechat,
            email: updatedEmail,
            phone: updatedPhone,
        }),
    })
        .then(response => response.json())
        .then(data => {
            console.log('Updated user info:', data);
        })
        .catch(error => {
            console.error('Error updating user info:', error);
        });
}

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

function logout() {
    const panelRight = document.getElementById('panelRight');
    panelRight.innerHTML = '';
    // 功能没想到，先空着吧
    updateButtonState('logout');
    //跳转到登录界面
    window.location.href = 'http://localhost:8080/FleaMarket/views/login';
}

function showOther() {
    const panelRight = document.getElementById('panelRight');
    panelRight.innerHTML = '';
    // 功能没想到，先空着吧

    updateButtonState('other');
}

// 在页面加载时，如果有当前活动按钮，则设置为默认选中状态
document.addEventListener('DOMContentLoaded', function () {
    if (currentActiveButton) {
        updateButtonState(currentActiveButton);
    }
});

// 在页面加载时，如果有当前活动按钮，则设置为默认选中状态
document.addEventListener('DOMContentLoaded', function () {
    if (currentActiveButton) {
        updateButtonState(currentActiveButton);
    }

    // 调用函数从数据库获取用户信息并显示
    fetchUserInfoFromDatabase();
});

// 从数据库获取用户信息并显示在界面上
function fetchUserInfoFromDatabase() {
    // 这里使用了假数据，实际情况需要通过后端接口获取用户信息
    // 假设后端接口为 '/api/userinfo'
    fetch('/api/userinfo')
        .then(response => response.json())
        .then(data => {
            // 调用函数更新用户信息显示
            updateUserInfoOnPage(data);
        })
        .catch(error => {
            console.error('Error fetching user info:', error);
        });
}

// 更新用户信息显示在页面上
function updateUserInfoOnPage(userInfo) {
    const studentId = document.getElementById('studentId');
    const userName = document.getElementById('username');
    const wechat = document.getElementById('wechat'); // Assuming you have an element with id 'wechat'
    const phone = document.getElementById('phone');
    const email = document.getElementById('email');
    // 更新页面上的用户信息
    studentId.value = userInfo.studentNo;
    userName.value = userInfo.userName;
    wechat.value = userInfo.wechat;
    phone.value = userInfo.phone;
    email.value = userInfo.email;
}

