#! /bin/bash

wintersmith build
s3cmd sync build/ s3://www.jnwng.com/
