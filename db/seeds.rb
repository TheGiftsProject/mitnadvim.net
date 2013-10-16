# -*- coding: utf-8 -*-

def create_recurrence(name)
  Recurrence.find_or_create_by_name(:name => name)
end

def create_area(name)
  Area.find_or_create_by_name(:name => name)
end

def create_category(name)
  Category.find_or_create_by_name(:name => name)
end

def create_program(name)
  Program.find_or_create_by_name(:name => name)
end

create_recurrence('חד-פעמי')
create_recurrence('שבועי')
create_recurrence('חודשי')

# Areas
create_area('בית שמש')
create_area('בני ברק')
create_area('ירושלים')
create_area('לוד')
create_area('תל אביב')

# Categories
create_category('חנכות לימודית')
create_category('חוגי העשרה')
create_category('הרצאות והדרכות')
create_category('מחשבים, מולטימדיה ואנטרנט')
create_category('גיוס כספים')
create_category('גינון')
create_category('הוראה מתקנת וליקוי למידה (אנשי מקצוע)')
create_category('הסעות והובלות')
create_category('התנדבות בספרייה')
create_category('התנדבות מהבית')
create_category('תחזוקה ושיפוץ')

# Programs

