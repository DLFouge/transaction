$(function() {
	/*
	 * 1. 得到所有的错误信息，循环遍历之。调用一个方法来确定是否显示错误信息！
	 */
	$(".pull-left").each(function() {
		showError($(this)); // 遍历每个元素，使用每个元素来调用showError方法
	});


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
		if (!validateNewPassword()) {
			
			flag = false;
		}
		if (!validateRepeatNewPassword()) {
			
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
 * 对登陆密码验证
 */
function validateOldPassword() {
	/*
	 * 1.非空验证
	 */
	var id = "oldPassword";
	var value = $("#" + id).val().trim();

	var labelId = $("#" + id + "Error");// 获取错误信息显示id
	if (!value) {
		labelId.text("旧密码不能为空！");
		showError(labelId);
		return false;
	}
	/*
	 * 2.长度验证
	 */
	if (value.length < 8 || value.length > 20) {
		labelId.text("旧密码长度应该介于8到20之间");
		showError(labelId);
		return false;
	}
	$.ajax({
		url : "ajaxOldPassword",
		data : {
			oldPassword : value
		},
		type : "POST",
		dataType : "json",
		async : false,
		cache : false,
		success : function(result) {
			if (result) {
				labelId.text("旧密码错误！");
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
function validateNewPassword() {
	/*
	 * 1.非空验证
	 */
	var id = "newPassword";
	var value = $("#" + id).val().trim();

	var labelId = $("#" + id + "Error");// 获取错误信息显示id
	if (!value) {
		labelId.text("新密码不能为空！");
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
function validateRepeatNewPassword() {
	/*
	 * 1.非空验证
	 */
	var id = "repeatNewPassword";
	var value = $("#" + id).val().trim();

	var labelId = $("#" + id + "Error");// 获取错误信息显示id
	if (!value) {
		labelId.text("新确认密码不能为空！");
		showError(labelId);
		return false;
	}

	/*
	 * 2.确认密码与密码一致性验证
	 */
	if (value != $("#newPassword").val()) {
		labelId.text("两次密码不一致！");
		showError(labelId);
		return false;
	}
	return true;

}

