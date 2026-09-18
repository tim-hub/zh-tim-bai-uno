{{- $slug := replaceRE "^[0-9]{4}-[0-9]{2}-[0-9]{2}-" "" .File.ContentBaseName -}}
+++
date = "{{ .Date }}"
draft = false
title = '{{ replace $slug "-" " " | title }}'
description = ''
preview = ''
tags = []
+++
