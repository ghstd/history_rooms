import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
	connect() {
		console.log('connect')

		this.state = {
			optionClicked: false
		}

		const form = this.element.querySelector('.quiz_game_main_form')

		if (!form) {
			console.log('form not found')
			return
		}

		form.oninput = this.formInputHandler.bind(this)
		form.onsubmit = this.formSubmitHandler.bind(this)

		document.addEventListener('turbo:before-stream-render', this.beforeStreamRenderHandler.bind(this))
	}



	beforeStreamRenderHandler(event) {
		console.log('beforeStreamRenderHandler')
		const action = event.target.getAttribute('action')
		if (action === 'form_submit') {
			const form = this.element.querySelector('.quiz_game_main_form')
			event.preventDefault()
			form.submit()
			return
		}
	}


	async formInputHandler(event) {
		console.log('formInputHandler')

		if (this.state.optionClicked) {
			return
		}

		this.state.optionClicked = true

		const form = this.element.querySelector('.quiz_game_main_form')
		const formData = new FormData(form)
		formData.append('player_action', 'option_сlicked')
		const searchParams = new URLSearchParams(formData)
		const queryString = searchParams.toString();

		const url = `${form.action}?${queryString}`

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

	async formSubmitHandler(event) {
		console.log('formSubmitHandler')

		event.preventDefault()

		const form = this.element.querySelector('.quiz_game_main_form')
		const searchParams = new URLSearchParams({ 'player_action': 'form_submit' })
		const queryString = searchParams.toString()

		const url = `${form.action}?${queryString}`

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
