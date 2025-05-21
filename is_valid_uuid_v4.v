/*
    Make a package.
*/
module faker

import regex

pub struct Parameters {
    pub:
        uuid string
        with_hyphens bool = true
}

pub fn is_valid_uuid_v4(parameters Parameters) bool {
    if parameters.with_hyphens {
        if parameters.uuid.len != 36 {
            return false
        }

        // Check basic format with regex
        mut re := regex.regex_opt(r'^[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$') or {
            println('Error compiling regex: $err')
            return false
        }

        // Case insensitive match
        return re.matches_string(parameters.uuid)
    } else {
        if parameters.uuid.len != 32 {
            return false
        }

        // Check format for UUID without hyphens
        mut re := regex.regex_opt(r'^[0-9a-f]{8}[0-9a-f]{4}4[0-9a-f]{3}[89ab][0-9a-f]{3}[0-9a-f]{12}$') or {
            println('Error compiling regex: $err')
            return false
        }

        // Case insensitive match
        return re.matches_string(parameters.uuid)
    }
}
