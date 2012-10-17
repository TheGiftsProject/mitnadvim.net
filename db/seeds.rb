# -*- coding: utf-8 -*-
weekly_recurrence = Recurrence.create(:name => "שבועי")

## AREAS
Area.create!(:name => "בית שמש")
Area.create!(:name => "בני ברק")
Area.create!(:name => "ירושלים")
Area.create!(:name => "לוד")
Area.create!(:name => "תל אביב")

matan_bar = User.create(:first_name => "מתן", :last_name => "בר", :phone_number => "054319875161", :email => "matan@example.com", :birth_year => 1984, :area => tel_aviv_area)
teaching_request.responses.create(:user => matan_bar)

## CATEGORIES
Category.create!(:name => "חנכות לימודית")
Category.create!(:name => "חוגי העשרה")
Category.create!(:name => "הרצאות והדרכות")
Category.create!(:name => "מחשבים, מולטימדיה ואנטרנט")
Category.create!(:name => "גיוס כספים")
Category.create!(:name => "גינון")
Category.create!(:name => "טרפיות, הוראה מתקנת וליקוי למידה (אנשי מקצוע)")
Category.create!(:name => "הסעות והובלות")
Category.create!(:name => "התנדבות בספרייה")
Category.create!(:name => "התנדבות מהבית")
Category.create!(:name => "תחזוקה ושיפוץ")
