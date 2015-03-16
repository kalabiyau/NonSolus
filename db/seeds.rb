Category.find_or_initialize_by(name: 'Travel').update_attributes(
    color: '598526',
    icon: 'fa-plane'
)
Category.find_or_initialize_by(name: 'Sport').update_attributes(
    color: 'd18816',
    icon: 'fa-futbol-o'
)
Category.find_or_initialize_by(name: 'Buy or Sell').update_attributes(
    color: '6d138a',
    icon: 'fa-money'
)
Category.find_or_initialize_by(name: 'Exchange').update_attributes(
    color: 'f36523',
    icon: 'fa-exchange'
)
Category.find_or_initialize_by(name: 'Recreation').update_attributes(
    color: '015b7e',
    icon: 'fa-coffee'
)
Category.find_or_initialize_by(name: 'Hacking').update_attributes(
    color: '6cd9d2',
    icon: 'fa-file-code-o'
)
Category.find_or_initialize_by(name: 'Other').update_attributes(
    color: 'b1cb8e',
    icon: 'fa-question'
)
