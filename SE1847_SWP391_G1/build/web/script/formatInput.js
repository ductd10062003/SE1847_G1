let input = document.querySelectorAll(".form-control");
let form = document.querySelector('form');
let password = document.querySelector('#password');
let re_password = document.querySelector('#re_password');
const email_regex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

for (let i = 0; i < input.length; i++) {
    input[i].onblur = () => {
        let value = input[i].value.trim();
        if (value.length === 0) {
            let parent_node = input[i].parentElement;
            parent_node.lastElementChild.innerHTML = 'Bạn chưa điền thông tin';
        }
        if (input[i].getAttribute('id') === 're_password' && password.value.trim() !== re_password.value.trim()) {
            let parent_node = input[i].parentElement;
            parent_node.lastElementChild.innerHTML = 'Mật khẩu không khớp';
        }
        if (value.length !== 0 && input[i].getAttribute('id') === 'email' && email_regex.test(value) === false) {
            let parent_node = input[i].parentElement;
            parent_node.lastElementChild.innerHTML = 'Email không hợp lệ';
        }
    }
    input[i].oninput = () => {
        let parent_node = input[i].parentElement;
        parent_node.lastElementChild.innerHTML = ''
    }
}
;

form.onsubmit = (event) => {
    if (document.activeElement.id !== 'back') {
        for (let i = 0; i < input.length; i++) {
            if (input[i].value.trim() === 0) {
                event.preventDefault();
                let parent_node = input[i].parentElement;
                parent_node.lastElementChild.innerHTML = 'Bạn chưa điền thông tin'
            }
        }
    }
};
