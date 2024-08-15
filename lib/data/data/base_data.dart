import 'package:hamdars/domain/entities/category.dart';

class BaseData {

  static List<Category> categories() => [
        Category(
          id: 1,
          name: 'خانه',
          subcategories: [
            Subcategory(id: 1, name: 'اجاره'),
            Subcategory(id: 2, name: 'شارژ ساختمان'),
            Subcategory(id: 3, name: 'وسایل منزل'),
          ],
        ),
        Category(
          id: 2,
          name: 'شرکت',
          subcategories: [
            Subcategory(id: 1, name: 'حقوق پرسنل'),
            Subcategory(id: 2, name: 'تنخواه'),
            Subcategory(id: 3, name: 'هزینه جاری'),
            Subcategory(id: 4, name: 'اجاره'),
            Subcategory(id: 5, name: 'سایر'),
          ],
        ),
        Category(
          id: 3,
          name: 'قبوض',
          subcategories: [
            Subcategory(id: 1, name: 'آب'),
            Subcategory(id: 2, name: 'برق گار'),
            Subcategory(id: 3, name: 'تلفن'),
            Subcategory(id: 4, name: 'موبایل'),
            Subcategory(id: 5, name: 'اینترنت'),
          ],
        ),
        /*Category(
        id: 1,
        name: 'غذا و خواروبار',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'ماشین',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'حمل و نقل',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'مصرفی',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'شخصی',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'تفریح و ورزش',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'سفر',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'مالی',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),
      Category(
        id: 1,
        name: 'هزینه بورسی',
        subcategories: [
          Subcategory(id: 1, name: ''),
          Subcategory(id: 2, name: ''),
        ],
      ),*/
      ];
}
