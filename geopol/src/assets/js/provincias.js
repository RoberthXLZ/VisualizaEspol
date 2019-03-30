export default function provincias (region) {
  if (region === 'Sierra'){
    return [
    'Carchi',
    'Imbabura',
    'Pichincha',
    'Cotopaxi',
    'Tungurahua',
    'Bolívar',
    'Chimborazo',
    'Cañar',
    'Azuay',
    'Loja',
    'Sto. Domingo de los Tsachilas'
    ]
  }
  else if (region === 'Costa'){
    return [
    'Esmeraldas',
    'Manabí',
    'Guayas',
    'Los Ríos',
    'El Oro',
    'Santa Elena'
    ]
  }
  else if (region === 'Oriente'){
    return [
    'Sucumbíos',
    'Napo',
    'Pastaza',
    'Orellana',
    'Morona Santiago',
    'Zamora Chinchipe'
    ]
  }
}