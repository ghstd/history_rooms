import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	connect() {
		this.clientId = 'client_' + Math.random().toString(36).slice(2)
		const form = this.element.querySelector('.quiz_game_edit_form')
		form.oninput = this.formInputHandler.bind(this)
		document.addEventListener('turbo:before-stream-render', this.beforeStreamRenderHandler.bind(this));

		const observer = new MutationObserver(this.mutationObserverCallback.bind(this))
		const targetNode = this.element.querySelector('turbo-frame')
		observer.observe(targetNode, { childList: true })
	}

	mutationObserverCallback(mutationsList) {
		for (let mutation of mutationsList) {
			if (mutation.type === 'childList') {
				mutation.addedNodes.forEach((node) => {
					if (node.nodeName === 'FORM') {
						node.oninput = this.formInputHandler.bind(this)
					}
				})
			}
		}
	}

	beforeStreamRenderHandler(event) {
		const newStream = event.detail.newStream
		const template = newStream.querySelector('template')
		if (template) {
			const fragment = template.content
			if (fragment.querySelector('meta')) {
				const url = fragment.querySelector('meta').getAttribute('url')
				window.location.href = url
				return
			}
			const form = fragment.querySelector('form')
			const serverClientId = form ? form.dataset.clientId : null
			if (serverClientId && serverClientId === this.clientId) {
				event.preventDefault()
			}
		}
	}

	async formInputHandler(event) {
		const form = this.element.querySelector('.quiz_game_edit_form')
		const formData = new FormData(form)
		formData.append('client_id', this.clientId)
		const searchParams = new URLSearchParams(formData);
		const queryString = searchParams.toString();

		const url = `${form.action}/edit?${queryString}`;

		try {
			const response = await fetch(url, {
				method: 'GET',
				headers: {
					'X-Requested-With': 'XMLHttpRequest'
				}
			})

			if (!response.ok) {
				console.error('Ошибка при отправке формы, response.statusText: ', response.statusText)
			}

		} catch (error) {
			console.error('Ошибка при отправке формы, error: ', error)
		}
	}
}
