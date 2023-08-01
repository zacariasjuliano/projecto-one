// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap
//= require_tree .

const excluir = async (url) => {

    if (confirm("Confirma ?")){
        
        try {

            const token = document.querySelector("meta[name='csrf-token']").content;
            const urlWithToken = `${url}?authenticity_token=${encodeURIComponent(token)}`;
            const response = await fetch(urlWithToken, { method: 'DELETE' });

            if (response.ok) {
                window.location.reload()
            } else {
                alert('Erro ao excluir o contato.');
            }

        } catch (error) {

            alert('Ocorreu um erro na requisição.' + error.message);

        }

    }

}


const atualizar = async (event) => {
    
    try {

        event.preventDefault();
        const form = event.target
  
        const url = form.action;
        const formData = new FormData(form);
    
        const body = {};
        formData.forEach((value, key) => {
            body[key] = value;
        });

        const response = await fetch(url, {
            
            method: 'PUT',
            headers: {
            'Content-Type': 'application/json',
            },
            body: JSON.stringify(body)

        });
    
        if (response.ok) {
            console.log('Contato atualizado com sucesso.');
            window.location.href = "/contactos"
        } else {
            alert('Erro ao atualizar o contato.');
        }

    } catch (error) {
        alert('Ocorreu um erro na requisição.' + error.message);
    }
};


const excluir_banco = async (url) => {

    if (confirm("Confirma ?")){
        
        try {

            const token = document.querySelector("meta[name='csrf-token']").content;
            const urlWithToken = `${url}?authenticity_token=${encodeURIComponent(token)}`;
            const response = await fetch(urlWithToken, { method: 'DELETE' });

            if (response.ok) {
                window.location.reload()
            } else {
                alert('Erro ao excluir o banco.');
            }

        } catch (error) {

            alert('Ocorreu um erro na requisição.' + error.message);

        }

    }

}


document.addEventListener('DOMContentLoaded', () => {

    const campoBusca = document.querySelector(".autocomplete-nome-banco");

    campoBusca.onkeyup = async (e) => {

        const valorDigitado = campoBusca.value;
        let divBuscaAutoComplete = document.querySelector(".divBuscaAutoComplete");

        if(!divBuscaAutoComplete) {
            campoBusca.parentNode.innerHTML += "<div class='divBuscaAutoComplete'></div>"
            //console.log(valorDigitado)
        }

        divBuscaAutoComplete = document.querySelector(".divBuscaAutoComplete");

        const response = await fetch("/bancos.json");

        if (!response.ok) {
            //throw new Error('Erro ao carregar os dados dos bancos.');
            console.log('Erro ao carregar os dados dos bancos.');
            return;
        }

        const bancosData = await response.json();

        divBuscaAutoComplete.innerHTML = `
            <ul>
                ${
                    bancosData.map((banco) => { return `<li>${banco.nome}</li>` })
                }                
            <ul>
        `;

    }

});
