module faker

struct FakerTypedList {
pub mut:
	helper Faker
}

pub fn (mut ftl FakerTypedList) generate[T](size u32) ![]T {
	mut results := []T{}

	for _ in 0 .. size {
		mut item := T{}
		$for field in T.fields {
			mut filename := unsafe { field.name.str.vstring() }

			for attr in field.attrs {
				if attr.starts_with('fake_source:') {
					if attr.len <= 12 {
						return error('${attr} on ${field.name} must have an argument')
					}
					filename = unsafe { attr.str.vstring() }
					value := ftl.helper.random_line_in_file(filename[12..].trim(' '))
					item.$(field.name) = value
					break
				}
				continue
			}
		}
		results << item
	}
	return results
}
