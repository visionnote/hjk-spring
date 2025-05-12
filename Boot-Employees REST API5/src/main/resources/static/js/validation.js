function CheckAddProduct() {
    var name = document.getElementById("name");
    var unitPrice = document.getElementById("unitPrice");
    var unitsInStock = document.getElementById("unitsInStock");

    // 상품명 체크
    if (name.value.trim().length < 4 || name.value.trim().length > 12) {
        alert("[상품명]\n 최소 4자에서 최대 12자까지 입력하세요");
        name.focus();
        return false;
    }

    // 상품 가격 체크
    if (unitPrice.value.trim().length === 0 || isNaN(unitPrice.value.trim())) {
        alert("[가격]\n숫자만 입력하세요");
        unitPrice.focus();
        return false;
    }

    if (parseFloat(unitPrice.value.trim()) < 0) {
        alert("[가격]\n음수는 입력할 수 없습니다.");
        unitPrice.focus();
        return false;
    } else if (!check(/^\d+(\.\d{1,2})?$/, unitPrice, "[가격]\n소숫점 둘째 자리까지만 입력하세요")) {
        return false;
    }
    
    // 재고 수 체크 
    if (unitsInStock.value.trim().length === 0 || isNaN(unitsInStock.value.trim())) {
        alert("[재고 수]\n숫자만 입력하세요");
        unitsInStock.focus();
        return false;
    }

    return true; // 폼 전송을 허용
}

function check(regExp, e, msg) {
    if (regExp.test(e.value.trim())) {
        return true;
    }
    alert(msg);
    e.focus();
    return false;
}