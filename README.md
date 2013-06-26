# Shoulda Lite

This gem stubs out active record to isolate your model tests from rails, which speeds things up a bunch. It also aims to support the shoulda api so you don't have to give up your current test coverage to isolate your tests.

**Currently this is only a proof of concept.** 

It only supports have_many, have_one, validate_presence_of, ensure_length_of, validate_uniqueness_of, and allow_value. It also doesn't support all options that are available in shoulda for those specs.

It also stubs out active record in a way that will probably break things in your specs.
