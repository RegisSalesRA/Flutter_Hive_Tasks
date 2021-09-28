from core.serializers import AtividadeSerializer, TecnicoSerializer
from core.models import Atividade, Tecnico
from typing import Generic
from django.db.models.fields import GenericIPAddressField
from django.shortcuts import render
from rest_framework.serializers import Serializer
from rest_framework import generics


class AtividadeList(generics.ListCreateAPIView):
    queryset = Atividade.objects.all()
    serializer_class = AtividadeSerializer

class AtividadeDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Atividade.objects.all()
    serializer_class = AtividadeSerializer