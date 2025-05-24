module faker

pub struct GetRowsInFileParameters {
    pub:
        file   string
        not_tied_to_lang bool
        lang Lang = .en
}
