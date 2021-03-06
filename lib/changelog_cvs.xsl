<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html [<!ENTITY nbsp  "&#160;" >]>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/1999/XSL/Transform' version='1.0'>
		<!--
				Copyright  2002,2004-2005 The Apache Software Foundation

				Licensed under the Apache License, Version 2.0 (the "License");
				you may not use this file except in compliance with the License.
				You may obtain a copy of the License at

				http://www.apache.org/licenses/LICENSE-2.0

				Unless required by applicable law or agreed to in writing, software
				distributed under the License is distributed on an "AS IS" BASIS,
				WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
				See the License for the specific language governing permissions and
				limitations under the License.

		-->
		<xsl:param name="title" />
		<xsl:param name="module" />
		<xsl:param name="server" />
		<xsl:param name="deployed" />
		<xsl:param name="SCMdeployed" />
		<xsl:param name="SCMuser" />
		<xsl:param name="SCMhistorytag" />
		<xsl:param name="SCMweb" />
		<xsl:output method="html" indent="yes" encoding="US-ASCII" doctype-public="-//W3C//DTD HTML 4.01//EN" doctype-system="http://www.w3.org/TR/html401/strict.dtd" />
		<!-- Copy standard document elements.  Elements that
				should be ignored must be filtered by apply-templates
				tags. -->
		<xsl:template match="*">
				<xsl:copy>
						<xsl:copy-of select="attribute::*[. != '']" />
						<xsl:apply-templates />
				</xsl:copy>
		</xsl:template>
		<xsl:template match="changelog">
				<html>
						<head>
								<title>
										<xsl:value-of select="$title" />
								</title>
								<style type="text/css">body, p { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 80%; color: #000000; background-color: #ffffff; } tr, td { font-family: Verdana, Arial, Helvetica, sans-serif; background: #eeeee0; } td { padding-left: 20px; } .dateAndAuthor { font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; text-align: left; background: #a6caf0; padding-left: 3px; } a { color: #000000; } pre { font-weight: bold; }</style>
						</head>
						<body>
								<h2>
										<a name="top">
												<xsl:value-of select="$title" />
										</a>
								</h2>
								<hr />
								<table>
										<tr>
												<td>
														<b>User</b>
												</td>
												<td>
														<xsl:value-of select="$SCMuser" />
												</td>
										</tr>
										<tr>
												<td>
														<b>Project</b>
												</td>
												<td>
														<xsl:value-of select="$module" />
												</td>
										</tr>
										<tr>
												<td>
														<b>Server</b>
												</td>
												<td>
														<xsl:value-of select="$server" />
												</td>
										</tr>
										<tr>
												<td>
														<b>Deployed version</b>
												</td>
												<td>
														<xsl:value-of select="$SCMdeployed" />
												</td>
										</tr>
										<tr>
												<td>
														<b>New History Tag</b>
												</td>
												<td>
														<xsl:value-of select="$SCMhistorytag" />
												</td>
										</tr>
								</table>
								<p style="text-align: right">
										Designed for use with
										<a href="http://ant.apache.org/">Apache Ant</a>
										.
								</p>
								<hr />
								<table border="0" width="100%" cellspacing="1">
										<xsl:apply-templates select=".//entry">
												<xsl:sort select="date" data-type="text" order="descending" />
												<xsl:sort select="time" data-type="text" order="descending" />
										</xsl:apply-templates>
								</table>
						</body>
				</html>
		</xsl:template>
		<xsl:template match="entry">
				<tr>
						<td class="dateAndAuthor">
								<xsl:value-of select="date" />
								<xsl:text>
					&nbsp;
				</xsl:text>
								<xsl:value-of select="time" />
								<xsl:text>
					&nbsp;
				</xsl:text>
								<xsl:value-of select="author" />
						</td>
				</tr>
				<tr>
						<td>
								<pre>
										<xsl:apply-templates select="msg" />
								</pre>
								<ul>
										<xsl:apply-templates select="file" />
								</ul>
						</td>
				</tr>
		</xsl:template>
		<xsl:template match="date">
				<i>
						<xsl:value-of select="." />
				</i>
		</xsl:template>
		<xsl:template match="time">
				<i>
						<xsl:value-of select="." />
				</i>
		</xsl:template>
		<xsl:template match="author">
				<i>
						<xsl:value-of select="." />
				</i>
		</xsl:template>
		<xsl:template match="file">
				<li>
						<xsl:value-of select="name" />
						(
						<xsl:value-of select="revision" />
						)
				</li>
		</xsl:template>
		<!-- Any elements within a msg are processed,
				so that we can preserve HTML tags. -->
		<xsl:template match="msg">
				<xsl:apply-templates />
		</xsl:template>
</xsl:stylesheet>
