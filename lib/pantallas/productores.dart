import 'package:flutter/material.dart';

class ProductoresPage extends StatefulWidget {
	const ProductoresPage({super.key});

	@override
	State<ProductoresPage> createState() => _ProductoresPageState();
}

class _ProductoresPageState extends State<ProductoresPage> {
	final TextEditingController _searchController = TextEditingController();
	String _selectedCategory = 'Todos';
	int _selectedNavigation = 0;

	@override
	void dispose() {
		_searchController.dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		final theme = Theme.of(context);

		return Scaffold(
			backgroundColor: const Color(0xFFF8F6F0),
			body: SafeArea(
				child: Column(
					children: [
						_Header(onLocationPressed: () {}),
						Expanded(
							child: ListView(
								padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
								children: [
									_SearchBar(controller: _searchController),
									const SizedBox(height: 18),
									_CategoryFilters(
										selectedCategory: _selectedCategory,
										onCategorySelected: (category) {
											setState(() => _selectedCategory = category);
										},
									),
									const SizedBox(height: 22),
									_FeaturedBanner(onPressed: () {}),
									const SizedBox(height: 28),
									Row(
										mainAxisAlignment: MainAxisAlignment.spaceBetween,
										crossAxisAlignment: CrossAxisAlignment.end,
										children: [
											Text(
												'Productores destacados',
												style: theme.textTheme.headlineSmall?.copyWith(
													fontWeight: FontWeight.w800,
													color: const Color(0xFF1E2A20),
												),
											),
											Text(
												'${producerData.length} cerca de ti',
												style: theme.textTheme.bodyMedium?.copyWith(
													color: const Color(0xFF6D766C),
													fontWeight: FontWeight.w600,
												),
											),
										],
									),
									const SizedBox(height: 14),
									ListView.builder(
										itemCount: producerData.length,
										shrinkWrap: true,
										physics: const NeverScrollableScrollPhysics(),
										itemBuilder: (context, index) {
											final producer = producerData[index];
											return Padding(
												padding: const EdgeInsets.only(bottom: 14),
												child: ProducerCard(
													producer: producer,
													onPressed: () {},
												),
											);
										},
									),
								],
							),
						),
					],
				),
			),
			bottomNavigationBar: BottomNavigation(
				selectedIndex: _selectedNavigation,
				onItemSelected: (index) {
					setState(() => _selectedNavigation = index);
				},
			),
		);
	}
}

class _Header extends StatelessWidget {
	const _Header({required this.onLocationPressed});

	final VoidCallback onLocationPressed;

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.fromLTRB(20, 18, 20, 16),
			child: Row(
				crossAxisAlignment: CrossAxisAlignment.start,
				children: [
					Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text(
									'Hola, Camila',
									style: Theme.of(context).textTheme.titleMedium?.copyWith(
												color: const Color(0xFF687267),
												fontWeight: FontWeight.w600,
											),
								),
								const SizedBox(height: 5),
								Text(
									'Sabores que nacen\ncerca de ti',
									style: Theme.of(context).textTheme.headlineMedium?.copyWith(
												color: const Color(0xFF1E2A20),
												fontWeight: FontWeight.w800,
												height: 1.05,
											),
								),
								const SizedBox(height: 10),
								InkWell(
									onTap: onLocationPressed,
									borderRadius: BorderRadius.circular(20),
									child: const Padding(
										padding: EdgeInsets.symmetric(vertical: 4),
										child: Row(
											mainAxisSize: MainAxisSize.min,
											children: [
												Icon(Icons.location_on_outlined,
														size: 17, color: Color(0xFF4F9955)),
												SizedBox(width: 4),
												Text(
													'Medellin, Antioquia',
													style: TextStyle(
														color: Color(0xFF4F9955),
														fontWeight: FontWeight.w700,
													),
												),
												Icon(Icons.keyboard_arrow_down,
														size: 18, color: Color(0xFF4F9955)),
											],
										),
									),
								),
							],
						),
					),
					_HeaderIcon(icon: Icons.notifications_none_rounded, onPressed: () {}),
					const SizedBox(width: 10),
					_HeaderIcon(
						icon: Icons.shopping_basket_outlined,
						badge: '3',
						onPressed: () {},
					),
				],
			),
		);
	}
}

class _HeaderIcon extends StatelessWidget {
	const _HeaderIcon({required this.icon, required this.onPressed, this.badge});

	final IconData icon;
	final String? badge;
	final VoidCallback onPressed;

	@override
	Widget build(BuildContext context) {
		return Stack(
			clipBehavior: Clip.none,
			children: [
				IconButton(
					onPressed: onPressed,
					icon: Icon(icon, color: const Color(0xFF3E493F)),
					style: IconButton.styleFrom(
						backgroundColor: const Color(0xFFE9F0E4),
						fixedSize: const Size(48, 48),
					),
				),
				if (badge != null)
					Positioned(
						right: -2,
						top: -5,
						child: Container(
							padding: const EdgeInsets.all(5),
							decoration: const BoxDecoration(
								color: Color(0xFFE47A43),
								shape: BoxShape.circle,
							),
							child: Text(
								badge!,
								style: const TextStyle(
									color: Colors.white,
									fontSize: 11,
									fontWeight: FontWeight.w800,
								),
							),
						),
					),
			],
		);
	}
}

class _SearchBar extends StatelessWidget {
	const _SearchBar({required this.controller});

	final TextEditingController controller;

	@override
	Widget build(BuildContext context) {
		return TextField(
			controller: controller,
			decoration: InputDecoration(
				hintText: 'Buscar productor, producto o region',
				hintStyle: const TextStyle(color: Color(0xFF7A8278)),
				prefixIcon: const Icon(Icons.search, color: Color(0xFF4F9955)),
				suffixIcon: IconButton(
					onPressed: () {},
					icon: const Icon(Icons.tune_rounded, color: Color(0xFF657066)),
				),
				filled: true,
				fillColor: const Color(0xFFEAF1E6),
				border: OutlineInputBorder(
					borderRadius: BorderRadius.circular(18),
					borderSide: BorderSide.none,
				),
				contentPadding: const EdgeInsets.symmetric(vertical: 17),
			),
		);
	}
}

class _CategoryFilters extends StatelessWidget {
	const _CategoryFilters({
		required this.selectedCategory,
		required this.onCategorySelected,
	});

	final String selectedCategory;
	final ValueChanged<String> onCategorySelected;

	@override
	Widget build(BuildContext context) {
		const categories = ['Todos', 'Frutas', 'Verduras', 'Lacteos', 'Cafe'];

		return SizedBox(
			height: 42,
			child: ListView.separated(
				scrollDirection: Axis.horizontal,
				itemCount: categories.length,
				separatorBuilder: (_, index) => const SizedBox(width: 9),
				itemBuilder: (context, index) {
					final category = categories[index];
					final isSelected = category == selectedCategory;
					return ChoiceChip(
						label: Text(category),
						selected: isSelected,
						onSelected: (_) => onCategorySelected(category),
						labelStyle: TextStyle(
							color: isSelected ? Colors.white : const Color(0xFF506050),
							fontWeight: FontWeight.w700,
						),
						selectedColor: const Color(0xFF4F9955),
						backgroundColor: const Color(0xFFF0E9D9),
						side: BorderSide.none,
						padding: const EdgeInsets.symmetric(horizontal: 13),
						shape: RoundedRectangleBorder(
							borderRadius: BorderRadius.circular(14),
						),
					);
				},
			),
		);
	}
}

class _FeaturedBanner extends StatelessWidget {
	const _FeaturedBanner({required this.onPressed});

	final VoidCallback onPressed;

	@override
	Widget build(BuildContext context) {
		return Container(
			padding: const EdgeInsets.fromLTRB(20, 18, 14, 18),
			decoration: BoxDecoration(
				color: const Color(0xFF315E3D),
				borderRadius: BorderRadius.circular(22),
			),
			child: Row(
				children: [
					const Expanded(
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: [
								Text('Cosecha de temporada',
										style: TextStyle(
												color: Color(0xFFD9E9CE),
												fontSize: 13,
												fontWeight: FontWeight.w700)),
								SizedBox(height: 6),
								Text('Compra local,\nimpacta nacional',
										style: TextStyle(
												color: Colors.white,
												fontSize: 21,
												height: 1.1,
												fontWeight: FontWeight.w800)),
							],
						),
					),
					IconButton(
						onPressed: onPressed,
						icon: const Icon(Icons.arrow_forward_rounded, color: Colors.white),
						style: IconButton.styleFrom(
							backgroundColor: const Color(0xFFE47A43),
						),
					),
				],
			),
		);
	}
}

class ProducerCard extends StatelessWidget {
	const ProducerCard({super.key, required this.producer, required this.onPressed});

	final Producer producer;
	final VoidCallback onPressed;

	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.white,
			borderRadius: BorderRadius.circular(20),
			child: InkWell(
				onTap: onPressed,
				borderRadius: BorderRadius.circular(20),
				child: Padding(
					padding: const EdgeInsets.all(14),
					child: Row(
						children: [
							Container(
								width: 76,
								height: 76,
								decoration: BoxDecoration(
									color: producer.color,
									borderRadius: BorderRadius.circular(16),
								),
								child: Icon(producer.icon, size: 38, color: producer.iconColor),
							),
							const SizedBox(width: 14),
							Expanded(
								child: Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: [
										Text(producer.name,
												maxLines: 1,
												overflow: TextOverflow.ellipsis,
												style: const TextStyle(
														color: Color(0xFF1E2A20),
														fontSize: 17,
														fontWeight: FontWeight.w800)),
										const SizedBox(height: 4),
										Text('${producer.region}  |  ${producer.distance}',
												style: const TextStyle(
														color: Color(0xFF788178), fontSize: 13)),
										const SizedBox(height: 9),
										Container(
											padding: const EdgeInsets.symmetric(
													horizontal: 9, vertical: 5),
											decoration: BoxDecoration(
												color: const Color(0xFFFFE9D8),
												borderRadius: BorderRadius.circular(9),
											),
											child: Text('${producer.products} productos disponibles',
													style: const TextStyle(
															color: Color(0xFFCB6A35),
															fontSize: 11,
															fontWeight: FontWeight.w700)),
										),
									],
								),
							),
							const Icon(Icons.chevron_right_rounded, color: Color(0xFF879087)),
						],
					),
				),
			),
		);
	}
}

class BottomNavigation extends StatelessWidget {
	const BottomNavigation({
		super.key,
		required this.selectedIndex,
		required this.onItemSelected,
	});

	final int selectedIndex;
	final ValueChanged<int> onItemSelected;

	@override
	Widget build(BuildContext context) {
		const items = [
			(Icons.home_rounded, 'Inicio'),
			(Icons.receipt_long_outlined, 'Pedidos'),
			(Icons.favorite_border_rounded, 'Favoritos'),
			(Icons.person_outline_rounded, 'Cuenta'),
		];

		return NavigationBar(
			selectedIndex: selectedIndex,
			onDestinationSelected: onItemSelected,
			backgroundColor: Colors.white,
			indicatorColor: const Color(0xFFFFE5D0),
			height: 72,
			destinations: [
				for (final item in items)
					NavigationDestination(icon: Icon(item.$1), label: item.$2),
			],
		);
	}
}

class Producer {
	const Producer({
		required this.name,
		required this.region,
		required this.distance,
		required this.products,
		required this.icon,
		required this.color,
		required this.iconColor,
	});

	final String name;
	final String region;
	final String distance;
	final int products;
	final IconData icon;
	final Color color;
	final Color iconColor;
}

const producerData = [
	Producer(
		name: 'Finca La Esperanza',
		region: 'El Retiro, Antioquia',
		distance: '3.2 km',
		products: 12,
		icon: Icons.eco_rounded,
		color: Color(0xFFE3F0D9),
		iconColor: Color(0xFF4F9955),
	),
	Producer(
		name: 'Huerta Dona Rosa',
		region: 'La Ceja, Antioquia',
		distance: '5.1 km',
		products: 7,
		icon: Icons.grass_rounded,
		color: Color(0xFFDCEEDC),
		iconColor: Color(0xFF5A9D61),
	),
	Producer(
		name: 'Asociacion El Manantial',
		region: 'Rionegro, Antioquia',
		distance: '8.4 km',
		products: 15,
		icon: Icons.water_drop_outlined,
		color: Color(0xFFDCEAF0),
		iconColor: Color(0xFF4A8796),
	),
	Producer(
		name: 'Granja Los Alpes',
		region: 'Guarne, Antioquia',
		distance: '10.0 km',
		products: 5,
		icon: Icons.egg_alt_outlined,
		color: Color(0xFFFFEBD3),
		iconColor: Color(0xFFC9823E),
	),
	Producer(
		name: 'Cafe Montanas Vivas',
		region: 'Jardin, Antioquia',
		distance: '42 km',
		products: 9,
		icon: Icons.coffee_rounded,
		color: Color(0xFFE9DFD4),
		iconColor: Color(0xFF8B5D3B),
	),
];
