from marshmallow import Schema, fields


class IdMixin(Schema):
    id = fields.Integer()


class IdDateMixin(IdMixin):
    created_at = fields.DateTime()
    updated_at = fields.DateTime()


class EntryFieldAnswerSchema(IdMixin):
    class Meta:
        additional = ['content', 'entry_field_id']


class EntryFieldSchema(IdMixin):
    class Meta:
        additional = ['name', 'type', 'color']


class EntrySchema(IdMixin):
    date = fields.DateTime()
    answers = fields.Nested('EntryFieldAnswerSchema', many=True)


class UserSchema(IdDateMixin):
    class Meta:
        additional = ['email', 'first_name', 'last_name', 'language', 'is_admin', 'use_colors']
