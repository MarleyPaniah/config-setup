#!/bin/zsh

echo "\nThis file shows a difference in behavior for arrays between bash and zsh."

if [ -z "$BASH" ]; then
    current_shell="bash"
else
    current_shell="zsh"
fi

ORIGINAL_ARRAY=("first" "second")
ARRAY=${ORIGINAL_ARRAY[@]}

echo "-- $current_shell with ARRAY=\${ORIGINAL_ARRAY[@]} --"
for element in ${ARRAY[@]}; do
    echo $element
done

# In bash the result will be:
# $ first
# $ second

# In zsh the result will be:
# $ first second

ARRAY=(${ORIGINAL_ARRAY[@]})

echo "-- $current_shell with ARRAY=(\${ORIGINAL_ARRAY[@]}) --"
for element in ${ARRAY[@]}; do
    echo $element
done