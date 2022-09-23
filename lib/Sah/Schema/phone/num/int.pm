package Sah::Schema::phone::num::int;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ["str" => {
    summary => 'International phone number, e.g. +628123456789',
    prefilters => ['Phone::format'],
    match => qr/\A\+([0-9 ]{5,20})\z/i,

    description => <<'_',

This schema accepts international phone number e.g. +628123456789. Some
formatting characters like dashes and spaces are accepted, as long as it passes
<pm:Number::Phone> formatting. The number will be formatted using international
phone number formatting by the Number::Phone module, e.g. '+62 812 3456 789'.

_
    examples => [
        {value=>'', valid=>0},
        {value=>"08123456789", valid=>0, summary=>'No country code'},
        {value=>"+628123456789", valid=>1, validated_value=>'+62 812 3456 789'},
        {value=>"628123456789", valid=>1, validated_value=>'+62 812 3456 789'},
    ],

}];

1;
# ABSTRACT:
