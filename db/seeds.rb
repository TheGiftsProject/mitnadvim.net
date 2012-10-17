# -*- coding: utf-8 -*-
tel_aviv_area = Area.create(:name => "תל אביב")
br_description = 'הקמפוס שלנו , הייחודי מסוגו בארץ – 13 שנתי , מגן ועד כיתה י"ב , מהווה מקור גאווה לעשייה החינוכית בישראל ובעיר תל אביב בפרט. קהילת הלומדים מהווה פסיפס אנושי מרתק המורכב מילדים ובני נוער מ 48 ארצות מוצא : עולים לצד ותיקים , ילדי מהגרי עבודה לצד ערבים ישראלים , ישראלים ותיקים וחדשים , פליטי סודאן דרפור ומבקשי מקלט מאריתריאה .'
bialik_rogozin = School.create(:name => "ביאליק רוגוזין", :area => tel_aviv_area, :description => br_description)
br_admin = User.create(:first_name => "אלי", :last_name => "נחמה", :phone_number => "05012345678", :email => "eli@example.com", :school => bialik_rogozin)

teaching_category = Category.create(:name => "לימוד 1 על 1")
teaching_request = Request.create(:name => "לימוד רובי", :description => "לימוד חד פעמי של רובי, כדי שמישהו יוכל לבנות מערכת מתנדבים", :category => teaching_category, :school => bialik_rogozin)

matan_bar = User.create(:first_name => "מתן", :last_name => "בר", :phone_number => "054319875161", :email => "matan@example.com", :birth_year => 1984, :area => tel_aviv_area)
teaching_request.responses.create(:user => matan_bar)