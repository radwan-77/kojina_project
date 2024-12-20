import 'package:kojina_project/model/meal_model.dart';
import 'package:kojina_project/provider/base_provider.dart';

class MealsProvider extends BaseProvider {

  /////////////////////////discounted meals////////////////////////
  List<MealModel> discountedMeals = [
    MealModel(
      id: 1,
      kitchenId: 1,
      kitchenName: 'Italian Kitchen',
      mealName: 'سباغيتي كاربونارا',
      mealDescription:
          'Classic Italian pasta dish with creamy sauce and pancetta.',
      ingredients: [
        'Pasta',
        'Eggs',
        'Pancetta',
        'Parmesan cheese',
        'Black pepper'
      ],
      mealImage: 'assets/meal1.png',
      price: 12,
      category: 'Italian',
      discount: 15,
      rating: 4.5,
    ),
    MealModel(
      id: 2,
      kitchenId: 2,
      kitchenName: 'Indian Kitchen',
      mealName: 'دجاج تيكا ماسالا',
      mealDescription:
          'Popular Indian curry dish with marinated chicken in a spiced tomato sauce.',
      ingredients: [
        'Chicken',
        'Yogurt',
        'Tomato',
        'Onion',
        'Garlic',
        'Ginger',
        'Spices'
      ],
      mealImage: 'assets/meal1.png',
      price: 15,
      category: 'Indian',
      discount: 10,
      rating: 4.7,
    ),
    MealModel(
      id: 3,
      kitchenId: 1,
      kitchenName: 'Japanese Kitchen',
      mealName: 'طبق سوشي',
      mealDescription:
          'Assorted sushi rolls with fresh fish, rice, and seaweed.',
      ingredients: [
        'Rice',
        'Fish',
        'Seaweed',
        'Soy sauce',
        'Wasabi',
        'Pickled ginger'
      ],
      mealImage: 'assets/meal1.png',
      price: 20,
      category: 'Japanese',
      discount: 5,
      rating: 4.8,
    ),
    MealModel(
      id: 4,
      kitchenId: 3,
      kitchenName: 'Mexican Kitchen',
      mealName: 'تاكو لحم البقر',
      mealDescription:
          'Mexican dish with seasoned beef, lettuce, cheese, and salsa in a tortilla.',
      ingredients: ['Beef', 'Tortilla', 'Lettuce', 'Cheese', 'Salsa'],
      mealImage: 'assets/meal1.png',
      price: 10,
      category: 'Mexican',
      discount: 2,
      rating: 4.3,
    ),
    MealModel(
      id: 5,
      kitchenId: 2,
      kitchenName: 'Thai Kitchen',
      mealName: 'باد تاي',
      mealDescription:
          'Stir-fried rice noodle dish with shrimp, peanuts, and bean sprouts.',
      ingredients: [
        'Rice noodles',
        'Shrimp',
        'Peanuts',
        'Bean sprouts',
        'Egg',
        'Tamarind paste'
      ],
      mealImage: 'assets/meal1.png',
      price: 14,
      category: 'Thai',
      discount: 3,
      rating: 4.6,
    ),
    MealModel(
      id: 6,
      kitchenId: 1,
      kitchenName: 'American Kitchen',
      mealName: 'تشيز برجر',
      mealDescription:
          'Classic American burger with beef patty, cheese, lettuce, and tomato.',
      ingredients: ['Beef patty', 'Cheese', 'Lettuce', 'Tomato', 'Bun'],
      mealImage: 'assets/meal1.png',
      price: 8,
      category: 'American',
      discount: 6,
      rating: 4.2,
    ),
    MealModel(
      id: 7,
      kitchenId: 3,
      kitchenName: 'Arab Kitchen',
      mealName: ' فلافل',
      mealDescription:
          'Middle Eastern wrap with falafel, hummus, and vegetables.',
      ingredients: ['Falafel', 'Hummus', 'Lettuce', 'Tomato', 'Wrap'],
      mealImage: 'assets/meal1.png',
      price: 9,
      category: 'Middle Eastern',
      discount: 5,
      rating: 4.4,
    ),
    MealModel(
      id: 8,
      kitchenId: 2,
      kitchenName: 'Italian Kitchen',
      mealName: 'بيتزا مارغريتا',
      mealDescription:
          'Classic Italian pizza with tomato, mozzarella, and basil.',
      ingredients: ['Tomato', 'Mozzarella', 'Basil', 'Pizza dough'],
      mealImage: 'assets/meal1.png',
      price: 11,
      category: 'Italian',
      discount: 5,
      rating: 4.5,
    ),
    MealModel(
      id: 9,
      kitchenId: 1,
      kitchenName: 'Salad Kitchen',
      mealName: 'سلطة سيزر',
      mealDescription:
          'Salad with romaine lettuce, croutons, parmesan, and Caesar dressing.',
      ingredients: [
        'Romaine lettuce',
        'Croutons',
        'Parmesan',
        'Caesar dressing'
      ],
      mealImage: 'assets/meal1.png',
      price: 7,
      category: 'Salad',
      discount: 7,
      rating: 4.1,
    ),
    MealModel(
      id: 10,
      kitchenId: 3,
      kitchenName: 'Japanese Kitchen',
      mealName: 'رامن',
      mealDescription:
          'Japanese noodle soup with broth, noodles, and various toppings.',
      ingredients: ['Broth', 'Noodles', 'Pork', 'Egg', 'Green onions'],
      mealImage: 'assets/meal1.png',
      price: 13,
      category: 'Japanese',
      discount: 4,
      rating: 4.7,
    ),
    MealModel(
      id: 11,
      kitchenId: 2,
      kitchenName: 'British Kitchen',
      mealName: 'فيش اند شيبس',
      mealDescription: 'British dish with battered fish and fried potatoes.',
      ingredients: ['Fish', 'Potatoes', 'Batter', 'Tartar sauce'],
      mealImage: 'assets/meal1.png',
      price: 12,
      category: 'British',
      discount: 2,
      rating: 4.3,
    ),
    MealModel(
      id: 12,
      kitchenId: 1,
      kitchenName: 'Greek Kitchen',
      mealName: 'سلطة يونانية',
      mealDescription:
          'Salad with tomatoes, cucumbers, olives, feta cheese, and olive oil.',
      ingredients: [
        'Tomatoes',
        'Cucumbers',
        'Olives',
        'Feta cheese',
        'Olive oil'
      ],
      mealImage: 'assets/meal1.png',
      price: 8,
      category: 'Greek',
      discount: 1,
      rating: 4.2,
    ),
    MealModel(
      id: 13,
      kitchenId: 3,
      kitchenName: 'Vietnamese Kitchen',
      mealName: 'فو',
      mealDescription:
          'Vietnamese noodle soup with broth, rice noodles, and herbs.',
      ingredients: ['Broth', 'Rice noodles', 'Beef', 'Herbs', 'Lime'],
      mealImage: 'assets/meal1.png',
      price: 14,
      category: 'Vietnamese',
      discount: 3,
      rating: 4.6,
    ),
  ];


//////////////////available meals/////////////////////
  List<MealModel> availableMeals = [
    MealModel(
      id: 1,
      kitchenId: 1,
      kitchenName: 'المطبخ الإيطالي',
      mealName: ' كاربونارا',
      mealDescription: 'طبق مكرونة إيطالي كلاسيكي مع صلصة كريمية وبانسيتا.',
      ingredients: ['مكرونة', 'بيض', 'بانسيتا', 'جبن بارميزان', 'فلفل أسود'],
      mealImage: 'assets/meal1.png',
      price: 12,
      category: 'إيطالي',
      discount: 0,
      rating: 4.5,
    ),
    MealModel(
      id: 2,
      kitchenId: 2,
      kitchenName: 'المطبخ الهندي',
      mealName: 'دجاج تيكا ماسالا',
      mealDescription: 'طبق كاري هندي شهير مع دجاج متبل في صلصة طماطم متبلة.',
      ingredients: ['دجاج', 'زبادي', 'طماطم', 'بصل', 'ثوم', 'زنجبيل', 'توابل'],
      mealImage: 'assets/meal1.png',
      price: 15,
      category: 'هندي',
      discount: 0,
      rating: 4.7,
    ),
    MealModel(
      id: 3,
      kitchenId: 1,
      kitchenName: 'المطبخ الياباني',
      mealName: 'طبق سوشي',
      mealDescription: 'مجموعة متنوعة من لفائف السوشي مع سمك طازج وأرز ونوري.',
      ingredients: ['أرز', 'سمك', 'نوري', 'صلصة الصويا', 'واسابي', 'زنجبيل مخلل'],
      mealImage: 'assets/meal1.png',
      price: 20,
      category: 'ياباني',
      discount: 0,
      rating: 4.8,
    ),
    MealModel(
      id: 4,
      kitchenId: 3,
      kitchenName: 'المطبخ المكسيكي',
      mealName: 'تاكو لحم البقر',
      mealDescription: 'طبق مكسيكي مع لحم بقر متبل وخس وجبن وسالسا في تورتيلا.',
      ingredients: ['لحم بقر', 'تورتيلا', 'خس', 'جبن', 'سالسا'],
      mealImage: 'assets/meal1.png',
      price: 10,
      category: 'مكسيكي',
      discount: 0,
      rating: 4.3,
    ),
    MealModel(
      id: 5,
      kitchenId: 2,
      kitchenName: 'المطبخ التايلاندي',
      mealName: 'باد تاي',
      mealDescription: 'طبق نودلز أرز مقلي مع جمبري وفول سوداني وبراعم الفاصوليا.',
      ingredients: ['نودلز أرز', 'جمبري', 'فول سوداني', 'براعم الفاصوليا', 'بيض', 'معجون التمر الهندي'],
      mealImage: 'assets/meal1.png',
      price: 14,
      category: 'تايلاندي',
      discount: 0,
      rating: 4.6,
    ),
    MealModel(
      id: 6,
      kitchenId: 1,
      kitchenName: 'المطبخ الأمريكي',
      mealName: 'تشيز برجر',
      mealDescription: 'برجر أمريكي كلاسيكي مع شريحة لحم بقري وجبن وخس وطماطم.',
      ingredients: ['شريحة لحم بقري', 'جبن', 'خس', 'طماطم', 'خبز'],
      mealImage: 'assets/meal1.png',
      price: 8,
      category: 'أمريكي',
      discount: 0,
      rating: 4.2,
    ),
    MealModel(
      id: 7,
      kitchenId: 3,
      kitchenName: 'المطبخ العربي',
      mealName: 'فلافل',
      mealDescription: 'لفائف شرق أوسطية مع فلافل وحمص وخضروات.',
      ingredients: ['فلافل', 'حمص', 'خس', 'طماطم', 'خبز'],
      mealImage: 'assets/meal1.png',
      price: 9,
      category: 'شرق أوسطي',
      discount: 0,
      rating: 4.4,
    ),
    MealModel(
      id: 8,
      kitchenId: 2,
      kitchenName: 'المطبخ الإيطالي',
      mealName: 'بيتزا مارغريتا',
      mealDescription: 'بيتزا إيطالية كلاسيكية مع طماطم وموزاريلا وريحان.',
      ingredients: ['طماطم', 'موزاريلا', 'ريحان', 'عجينة بيتزا'],
      mealImage: 'assets/meal1.png',
      price: 11,
      category: 'إيطالي',
      discount: 0,
      rating: 4.5,
    ),
    MealModel(
      id: 9,
      kitchenId: 1,
      kitchenName: 'المطبخ الصحي',
      mealName: 'سلطة سيزر',
      mealDescription: 'سلطة مع خس روماني وقطع خبز محمص وجبن بارميزان وصلصة سيزر.',
      ingredients: ['خس روماني', 'قطع خبز محمص', 'جبن بارميزان', 'صلصة سيزر'],
      mealImage: 'assets/meal1.png',
      price: 7,
      category: 'سلطة',
      discount: 0,
      rating: 4.1,
    ),
    MealModel(
      id: 10,
      kitchenId: 3,
      kitchenName: 'المطبخ الياباني',
      mealName: 'رامن',
      mealDescription: 'حساء نودلز ياباني مع مرق ونودلز وتوابل متنوعة.',
      ingredients: ['مرق', 'نودلز', 'لحم خنزير', 'بيض', 'بصل أخضر'],
      mealImage: 'assets/meal1.png',
      price: 13,
      category: 'ياباني',
      discount: 0,
      rating: 4.7,
    ),
    MealModel(
      id: 11,
      kitchenId: 2,
      kitchenName: 'المطبخ البريطاني',
      mealName: 'فيش اند شيبس',
      mealDescription: 'طبق بريطاني مع سمك مقلي وبطاطس مقلية.',
      ingredients: ['سمك', 'بطاطس', 'عجينة', 'صلصة التارتار'],
      mealImage: 'assets/meal1.png',
      price: 12,
      category: 'بريطاني',
      discount: 0,
      rating: 4.3,
    ),
    MealModel(
      id: 12,
      kitchenId: 1,
      kitchenName: 'المطبخ اليوناني',
      mealName: 'سلطة يونانية',
      mealDescription: 'سلطة مع طماطم وخيار وزيتون وجبن فيتا وزيت زيتون.',
      ingredients: ['طماطم', 'خيار', 'زيتون', 'جبن فيتا', 'زيت زيتون'],
      mealImage: 'assets/meal1.png',
      price: 8,
      category: 'يوناني',
      discount: 0,
      rating: 4.2,
    ),
    MealModel(
      id: 13,
      kitchenId: 3,
      kitchenName: 'المطبخ الفيتنامي',
      mealName: 'فو',
      mealDescription: 'حساء نودلز فيتنامي مع مرق ونودلز أرز وأعشاب.',
      ingredients: ['مرق', 'نودلز أرز', 'لحم بقر', 'أعشاب', 'ليمون'],
      mealImage: 'assets/meal1.png',
      price: 14,
      category: 'فيتنامي',
      discount: 0,
      rating: 4.6,
    ),
  ];


//////////////////////primary meals////////////////////////
  List<MealModel> primaryMeals = [
    MealModel(
      id: 1,
      kitchenId: 1,
      kitchenName: 'Italian Kitchen',
      mealName: 'سباغيتي كاربونارا',
      mealDescription: 'Classic Italian pasta dish with creamy sauce and pancetta.',
      ingredients: ['Pasta', 'Eggs', 'Pancetta', 'Parmesan cheese', 'Black pepper'],
      mealImage: 'assets/meal1.png',
      price: 12,
      category: 'Italian',
      discount: 15,
      rating: 4.5,
    ),
    MealModel(
      id: 2,
      kitchenId: 2,
      kitchenName: 'Indian Kitchen',
      mealName: 'دجاج تيكا ماسالا',
      mealDescription: 'Popular Indian curry dish with marinated chicken in a spiced tomato sauce.',
      ingredients: ['Chicken', 'Yogurt', 'Tomato', 'Onion', 'Garlic', 'Ginger', 'Spices'],
      mealImage: 'assets/meal1.png',
      price: 15,
      category: 'Indian',
      discount: 10,
      rating: 4.7,
    ),
    MealModel(
      id: 3,
      kitchenId: 1,
      kitchenName: 'Japanese Kitchen',
      mealName: 'طبق سوشي',
      mealDescription: 'Assorted sushi rolls with fresh fish, rice, and seaweed.',
      ingredients: ['Rice', 'Fish', 'Seaweed', 'Soy sauce', 'Wasabi', 'Pickled ginger'],
      mealImage: 'assets/meal1.png',
      price: 20,
      category: 'Japanese',
      discount: 5,
      rating: 4.8,
    ),
    MealModel(
      id: 4,
      kitchenId: 3,
      kitchenName: 'Mexican Kitchen',
      mealName: 'تاكو لحم البقر',
      mealDescription: 'Mexican dish with seasoned beef, lettuce, cheese, and salsa in a tortilla.',
      ingredients: ['Beef', 'Tortilla', 'Lettuce', 'Cheese', 'Salsa'],
      mealImage: 'assets/meal1.png',
      price: 10,
      category: 'Mexican',
      discount: 2,
      rating: 4.3,
    ),
    MealModel(
      id: 5,
      kitchenId: 2,
      kitchenName: 'Thai Kitchen',
      mealName: 'باد تاي',
      mealDescription: 'Stir-fried rice noodle dish with shrimp, peanuts, and bean sprouts.',
      ingredients: ['Rice noodles', 'Shrimp', 'Peanuts', 'Bean sprouts', 'Egg', 'Tamarind paste'],
      mealImage: 'assets/meal1.png',
      price: 14,
      category: 'Thai',
      discount: 3,
      rating: 4.6,
    ),
    MealModel(
      id: 6,
      kitchenId: 1,
      kitchenName: 'American Kitchen',
      mealName: 'تشيز برجر',
      mealDescription: 'Classic American burger with beef patty, cheese, lettuce, and tomato.',
      ingredients: ['Beef patty', 'Cheese', 'Lettuce', 'Tomato', 'Bun'],
      mealImage: 'assets/meal1.png',
      price: 8,
      category: 'American',
      discount: 6,
      rating: 4.2,
    ),
    MealModel(
      id: 7,
      kitchenId: 3,
      kitchenName: 'Arab Kitchen',
      mealName: ' فلافل',
      mealDescription: 'Middle Eastern wrap with falafel, hummus, and vegetables.',
      ingredients: ['Falafel', 'Hummus', 'Lettuce', 'Tomato', 'Wrap'],
      mealImage: 'assets/meal1.png',
      price: 9,
      category: 'Middle Eastern',
      discount: 5,
      rating: 4.4,
    ),
    MealModel(
      id: 8,
      kitchenId: 2,
      kitchenName: 'Italian Kitchen',
      mealName: 'بيتزا مارغريتا',
      mealDescription: 'Classic Italian pizza with tomato, mozzarella, and basil.',
      ingredients: ['Tomato', 'Mozzarella', 'Basil', 'Pizza dough'],
      mealImage: 'assets/meal1.png',
      price: 11,
      category: 'Italian',
      discount: 5,
      rating: 4.5,
    ),
    MealModel(
      id: 9,
      kitchenId: 1,
      kitchenName: 'Salad Kitchen',
      mealName: 'سلطة سيزر',
      mealDescription: 'Salad with romaine lettuce, croutons, parmesan, and Caesar dressing.',
      ingredients: ['Romaine lettuce', 'Croutons', 'Parmesan', 'Caesar dressing'],
      mealImage: 'assets/meal1.png',
      price: 7,
      category: 'Salad',
      discount: 7,
      rating: 4.1,
    ),
    MealModel(
      id: 10,
      kitchenId: 3,
      kitchenName: 'Japanese Kitchen',
      mealName: 'رامن',
      mealDescription: 'Japanese noodle soup with broth, noodles, and various toppings.',
      ingredients: ['Broth', 'Noodles', 'Pork', 'Egg', 'Green onions'],
      mealImage: 'assets/meal1.png',
      price: 13,
      category: 'Japanese',
      discount: 4,
      rating: 4.7,
    ),
    MealModel(
      id: 11,
      kitchenId: 2,
      kitchenName: 'British Kitchen',
      mealName: 'فيش اند شيبس',
      mealDescription: 'British dish with battered fish and fried potatoes.',
      ingredients: ['Fish', 'Potatoes', 'Batter', 'Tartar sauce'],
      mealImage: 'assets/meal1.png',
      price: 12,
      category: 'British',
      discount: 2,
      rating: 4.3,
    ),
    MealModel(
      id: 12,
      kitchenId: 1,
      kitchenName: 'Greek Kitchen',
      mealName: 'سلطة يونانية',
      mealDescription: 'Salad with tomatoes, cucumbers, olives, feta cheese, and olive oil.',
      ingredients: ['Tomatoes', 'Cucumbers', 'Olives', 'Feta cheese', 'Olive oil'],
      mealImage: 'assets/meal1.png',
      price: 8,
      category: 'Greek',
      discount: 1,
      rating: 4.2,
    ),
    MealModel(
      id: 13,
      kitchenId: 3,
      kitchenName: 'Vietnamese Kitchen',
      mealName: 'فو',
      mealDescription: 'Vietnamese noodle soup with broth, rice noodles, and herbs.',
      ingredients: ['Broth', 'Rice noodles', 'Beef', 'Herbs', 'Lime'],
      mealImage: 'assets/meal1.png',
      price: 14,
      category: 'Vietnamese',
      discount: 3,
      rating: 4.6,
    ),
  ];

}
