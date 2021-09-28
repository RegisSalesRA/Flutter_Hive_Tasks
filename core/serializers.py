from rest_framework import serializers
from core.models import *
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token


class AtividadeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Atividade
        fields = "__all__" 
        depth = 1


from rest_framework import serializers
from core.models import *
from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token


class TecnicoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tecnico
        fields = "__all__" 
        depth = 1