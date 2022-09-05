(function() {
	// idea by https://twitter.com/Tayu0404

	const date2str = d => 
		`${d.getFullYear()}-${(d.getMonth()+1+'').padStart(2, '0')}-${(d.getDate()+'').padStart(2, '0')}`;

	const DAY = 24 * 60 * 60 * 1000;

	new Promise(resolve => {
		if (document.readyState != 'loading') resolve();
		document.addEventListener('DOMContentLoaded', resolve);
	}).then(() => {
		document.getElementById('dummy-date').textContent = date2str(
			new Date(new Date().getTime() - DAY * 3)
		);
	});
})();
