#!/bin/bash
bash full_train.sh icil-dit-th-cl.tokenized.clean.mr icil-dit-th-cl.tokenized.clean.hi
bash align_new.sh new.mr new.hi icil-dit-th-cl.tokenized.clean.mr icil-dit-th-cl.tokenized.clean.hi
