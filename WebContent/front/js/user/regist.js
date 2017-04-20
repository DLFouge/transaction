$(function() {
	/*
	 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
	 */
	$(".text-color-red pull-right").each(function() {
		showError($(this)); // 遍历每个元素，使用每个元素来调用showError方法
	});

	/*
	 * 2. 切换注册按钮的图片
	 */
	/*$("#submitBtn").hover(function() {
		$("#submitBtn").attr("src", "/goods/images/regist2.jpg");
	}, function() {
		$("#submitBtn").attr("src", "/goods/images/regist1.jpg");
	});
	*/

	/*
	 * 3.输入框得到焦点，让错误信息消失
	 * 
	 */
	$(".form-control").focus(function() {
		var labelId = $(this).attr("id") + "Error"; // 等到错误信息ID
		$("#" + labelId).text("");
		showError($("#" + labelId));

	});

	/*
	 * 4.输入框失去焦点,则对其进行验证
	 */
	$(".form-control").blur(
			function() {
				var inputId = $(this).attr("id"); // 获取当前Id
				// 获取输入框的值
				// 获取方法名
				var mName = "validate" + inputId.substring(0, 1).toUpperCase()
						+ inputId.substring(1) + "()";
				eval(mName);
			});

	$("#registForm").submit(function() {
		var flag = true;
		if (!validateLoginname()) {
			
			flag = false;
		}
		if (!validateLoginpass()) {
			
			flag = false;
		}
		if (!validateReloginpass()) {
			
			flag = false;
		}
		if (!validateEmail()) {
			flag = false;
		}
		if (!validateVerifyCode()) {
			flag = false;
		}
		return flag;

	});

});

/*
 * 判断当前元素是否存在内容，如果存在显示，不存在不显示！
 */
function showError(ele) {
	var text = ele.text();// 获取元素的内容
	if (!text) {// 如果没有内容
		ele.css("display", "none");// 隐藏元素
	} else {// 如果有内容
		ele.css("display", "");// 显示元素
	}
}

/*
 * 换一张验证码
 */
function _hyz() {
	/*
	 * 1. 获取<img>元素 2. 重新设置它的src 3. 使用毫秒来添加参数，这个参数是防止浏览器的缓存功能
	 */
	$("#imgVerifyCode").attr("src", "rand?a=" + new Date().getTime());
}

/*
 * 对用户名验证
 */
function validateUsername() {
	/*
	 * 1.非空验证
	 */
	var id = "username";
	var value = $("#" + id).val().trim();

	var labelId = $("#" + id + "Error");// 获取错误信息显示id
	if (!value) {
		labelId.text("用户名不能为空！");
		showError(labelId);
		return false;
	}
	/*
	 * 2.长度验证
	 */
	if (value.length < 3 || value.length > 20) {
		labelId.text("用户名长度应该介于3到20之间");
		showError(labelId);
		return false;
	}
	/*
	 * 3.是否注册验证
	 */
	$.ajax({
		url : "ajaxUsername",
		data : {
			username : value
		},
		type : "POST",
		dataType : "json",
		async : false,
		cache : false,
		success : function(result) {
			if (!result) {
				labelId.text("用户名已被注册！");
				showError(labelId);
				return false;
			}
		}
	});
	return true;
}

/*
 * 对登陆密码验证
 */
function validatePassword() {
	/*
	 * 1.非空验证
	 */
	var id = "password";
	var value = $("#" + id).val().trim();

	var labelId = $("#" + id + "Error");// 获取错误信息显示id
	if (!value) {
		labelId.text("登陆密码不能为空！");
		showError(labelId);
		return false;
	}
	/*
	 * 2.长度验证
	 */
	if (value.length < 8 || value.length > 20) {
		labelId.text("密码长度应该介于8到20之间");
		showError(labelId);
		return false;
	}

	return true;

}

/*
 * 对重复密码验证
 */
function validateRepeatpassword() {
	/*
	 * 1.非空验证
	 */
	var id = "repeatpassword";
	var value = $("#" + id).val().trim();

	var labelId = $("#" + id + "Error");// 获取错误信息显示id
	if (!value) {
		labelId.text("确认密码不能为空！");
		showError(labelId);
		return false;
	}

	/*
	 * 2.确认密码与密码一致性验证
	 */
	if (value != $("#password").val()) {
		labelId.text("两次密码不一致！");
		showError(labelId);
		return false;
	}
	return true;

}

/*
 * 对用邮箱验证
 */
function validateEmail() {
	var id = "email";
	var value = $("#" + id).val().trim();
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	var labelId = $("#" + id + "Error");// 获取错误信息显示id

	/*
	 * 1.邮箱非空认证
	 */
	if (!value) {
		labelId.text("Email地址不能为空！");
		showError(labelId);
		return false;
	}

	/*
	 * 2.邮箱格式认证
	 */
	if (!reg.test(value)) {
		labelId.text("Email格式错误！");
		showError(labelId);
		return false;
	}
	/*
	 * 3.邮箱是否注册
	 */
	$.ajax({
		url : "ajaxEmail",
		data : {
			email : value
		},
		type : "post",
		dataType : "json",
		async : false,
		cache : false,
		success : function(result) {
			if (!result) {
				labelId.text("邮箱已注册！");
				showError(labelId);
			}
		}

	});
	return true;
}

/*
 * 对验证码验证
 */
function validateVerifyCode() {
	var id = "verifyCode";
	var value = $("#" + id).val();
	var labelId = $("#" + id + "Error");

	/*
	 * 1.验证码为空验证
	 */
	if (!value) {
		labelId.text("验证码不能为空！");
		showError(labelId);
		return false;
	}
	/*
	 * 2.验证码长度验证
	 */
	if (value.length != 4) {
		labelId.text("验证码长度错误！");
		showError(labelId);
		return false;
	}
	/**
	 * 3.验证码输入是否正确
	 */
	$.ajax({
		url : "ajaxVerifyCode",
		data : {
			verifyCode : value
		},
		type : "post",
		dataType : "json",
		success : function(result) {
			if (!result) {
				labelId.text("验证码错误！");
				showError(labelId);
				return false;
			}
		}

	});
}
