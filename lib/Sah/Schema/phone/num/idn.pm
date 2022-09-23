package Sah::Schema::phone::num::idn;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ["str" => {
    summary => 'Indonesian phone number, e.g. +628123456789',
    prefilters => [
        ['Regexp::replace' => {from_pat=>qr/\A0/, to_str=>'+62'}],
        'Phone::format',
    ],
    match => qr/\A\+62([0-9 ]{5,20})\z/i,

    description => <<'_',

This schema accepts Indonesian phone number e.g. +628123456789. If number does
not contain country code, it will be assumed to be '+62' (Indonesian calling
code). Some formatting characters like dashes and spaces are accepted, as long
as it passes <pm:Number::Phone> formatting. The number will be formatted using
international phone number formatting by the Number::Phone module, e.g. '+62 812
3456 789'.

_
    examples => [
        {value=>'', valid=>0},
        {value=>"08123456789", valid=>1, validated_value=>'+62 812 3456 789'},
        {value=>"+442087712924", valid=>0, summary=>'Not Indonesian number'},
        {value=>"+628123456789", valid=>1, validated_value=>'+62 812 3456 789'},
        {value=>"628123456789", valid=>1, validated_value=>'+62 812 3456 789'},
    ],

}];

1;
# ABSTRACT:
