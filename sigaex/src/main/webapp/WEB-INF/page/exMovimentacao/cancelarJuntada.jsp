<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
	buffer="64kb"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://localhost/customtag" prefix="tags"%>
<%@ taglib uri="http://localhost/jeetags" prefix="siga"%>

<siga:pagina titulo="Desentranhamento">

<c:if test="${not mob.doc.eletronico}">
	<script type="text/javascript">$("html").addClass("fisico");$("body").addClass("fisico");</script>
</c:if>

	<div class="gt-bd clearfix">
		<div class="gt-content clearfix">
			<h2>Cancelamento de Juntada de Documento - ${mob.siglaEDescricaoCompleta}</h2>
			<div class="gt-content-box gt-for-table">
				<form action="${request.contextPath}/app/expediente/mov/cancelar_juntada_gravar" method="post">
					<input type="hidden" name="postback" value="1" />
					<input type="hidden" name="sigla" value="${sigla}" />
					
					<table class="gt-form-table">
						<tr class="header">
							<td colspan="2">Dados do cancelamento de juntada</td>
						</tr>
						<tr>
							<td>
								<label>Data:</label>
							</td>
							<td>
								<input type="text" name="dtMovString" onblur="javascript:verifica_data(this, true);"/>
							</td>
						</tr>
						<tr>
							<td>Responsável:</td>
							<td>
								<siga:selecao tema="simple" propriedade="subscritor" modulo="siga"/>&nbsp;
								<input type="checkbox" theme="simple" name="substituicao" onclick="javascript:displayTitular(this);" />&nbsp;Substituto
							</td>
						</tr>
						<c:set var="style" value="" />
						<c:if test="${!substituicao}">
							<c:set var="style" value="display:none" />
						</c:if>
						<tr id="tr_titular" style="${style}">
							<td>Titular:</td>
							<input type="hidden" name="campos" value="titularSel.id" />
							<td><siga:selecao propriedade="titular" tema="simple" modulo="siga"/></td>
						</tr>
						<tr>
							<td>
								<label>Motivo:</label>
							</td>
							<td>
								<input type="text" name="descrMov" maxlength="80" size="80" />
							</td>
						</tr>
						<tr class="button">
							<td colspan="2"><input type="submit" value="Ok" class="gt-btn-small gt-btn-left" /> <input type="button"
								value="Cancela" onclick="javascript:history.back();" class="gt-btn-small gt-btn-left" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</siga:pagina>
