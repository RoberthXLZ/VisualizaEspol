<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Listado de Usuarios</title>
</head>
<body>
	<h1>{{ $title }}</h1>

		@if (! empty($users))
			<ul>
				@foreach ($users as $user)
					<li>{{ $user }}</li>
				@endforeach
			</ul>
		@else
			<p>No hay usuarios registrados</p>
		@endif
</body>
</html>