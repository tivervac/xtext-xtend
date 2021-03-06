/*
 * generated by Xtext
 */
package org.eclipse.xtend.core

import com.google.inject.Binder
import com.google.inject.Provider
import com.google.inject.name.Names
import org.eclipse.xtend.core.compiler.UnicodeAwarePostProcessor
import org.eclipse.xtend.core.compiler.XtendCompiler
import org.eclipse.xtend.core.compiler.XtendGenerator
import org.eclipse.xtend.core.compiler.XtendOutputConfigurationProvider
import org.eclipse.xtend.core.conversion.IntUnderscoreValueConverter
import org.eclipse.xtend.core.conversion.JavaIDValueConverter
import org.eclipse.xtend.core.conversion.StringValueConverter
import org.eclipse.xtend.core.conversion.XtendValueConverterService
import org.eclipse.xtend.core.documentation.XtendDocumentationProvider
import org.eclipse.xtend.core.documentation.XtendFileHeaderProvider
import org.eclipse.xtend.core.findReferences.XtendReferenceFinder
import org.eclipse.xtend.core.imports.XtendImportedTypesUsageCollector
import org.eclipse.xtend.core.imports.XtendImportsConfiguration
import org.eclipse.xtend.core.imports.XtendTypeUsageCollector
import org.eclipse.xtend.core.jvmmodel.IXtendJvmAssociations
import org.eclipse.xtend.core.jvmmodel.XtendJvmModelInferrer
import org.eclipse.xtend.core.linking.RuntimeLinker
import org.eclipse.xtend.core.linking.XtendEObjectAtOffsetHelper
import org.eclipse.xtend.core.macro.AbstractFileSystemSupport
import org.eclipse.xtend.core.macro.JavaIOFileSystemSupport
import org.eclipse.xtend.core.macro.declaration.IResourceChangeRegistry
import org.eclipse.xtend.core.macro.declaration.NopResourceChangeRegistry
import org.eclipse.xtend.core.naming.XtendQualifiedNameProvider
import org.eclipse.xtend.core.parser.CustomXtendParser
import org.eclipse.xtend.core.parser.FlexTokenRegionProvider
import org.eclipse.xtend.core.parser.XtendPartialParsingHelper
import org.eclipse.xtend.core.parser.antlr.XtendTokenSourceProvider
import org.eclipse.xtend.core.parser.antlr.internal.DisabledAntlrLexer
import org.eclipse.xtend.core.parser.antlr.internal.InternalXtendLexer
import org.eclipse.xtend.core.resource.XtendLocationInFileProvider
import org.eclipse.xtend.core.resource.XtendResourceDescriptionManager
import org.eclipse.xtend.core.resource.XtendResourceDescriptionStrategy
import org.eclipse.xtend.core.scoping.AnonymousClassConstructorScopes
import org.eclipse.xtend.core.scoping.XtendImportedNamespaceScopeProvider
import org.eclipse.xtend.core.serializer.XtendSerializerScopeProvider
import org.eclipse.xtend.core.tasks.XtendTaskTagProvider
import org.eclipse.xtend.core.typesystem.LocalClassAwareTypeNames
import org.eclipse.xtend.core.typesystem.TypeDeclarationAwareBatchTypeResolver
import org.eclipse.xtend.core.typesystem.XtendReentrantTypeResolver
import org.eclipse.xtend.core.typesystem.XtendTypeComputer
import org.eclipse.xtend.core.typing.XtendExpressionHelper
import org.eclipse.xtend.core.validation.CachingResourceValidatorImpl
import org.eclipse.xtend.core.validation.XtendConfigurableIssueCodes
import org.eclipse.xtend.core.validation.XtendEarlyExitValidator
import org.eclipse.xtend.core.validation.XtendImplicitReturnFinder
import org.eclipse.xtend.core.xtend.XtendFactory
import org.eclipse.xtend.lib.macro.file.MutableFileSystemSupport
import org.eclipse.xtext.conversion.IValueConverterService
import org.eclipse.xtext.conversion.impl.IDValueConverter
import org.eclipse.xtext.conversion.impl.STRINGValueConverter
import org.eclipse.xtext.documentation.IEObjectDocumentationProvider
import org.eclipse.xtext.documentation.IFileHeaderProvider
import org.eclipse.xtext.findReferences.ReferenceFinder
import org.eclipse.xtext.findReferences.TargetURICollector
import org.eclipse.xtext.generator.IContextualOutputConfigurationProvider
import org.eclipse.xtext.generator.IGenerator2
import org.eclipse.xtext.generator.IOutputConfigurationProvider
import org.eclipse.xtext.generator.IShouldGenerate
import org.eclipse.xtext.linking.ILinker
import org.eclipse.xtext.naming.IQualifiedNameProvider
import org.eclipse.xtext.parser.IParser
import org.eclipse.xtext.parser.antlr.IPartialParsingHelper
import org.eclipse.xtext.parser.antlr.Lexer
import org.eclipse.xtext.parser.antlr.LexerBindings
import org.eclipse.xtext.parser.antlr.TokenSourceProvider
import org.eclipse.xtext.parser.impl.TokenRegionProvider
import org.eclipse.xtext.resource.EObjectAtOffsetHelper
import org.eclipse.xtext.resource.IDefaultResourceDescriptionStrategy
import org.eclipse.xtext.resource.ILocationInFileProvider
import org.eclipse.xtext.resource.IResourceDescription.Manager
import org.eclipse.xtext.resource.IResourceDescriptions
import org.eclipse.xtext.resource.impl.EagerResourceSetBasedResourceDescriptions
import org.eclipse.xtext.resource.persistence.IResourceStorageFacade
import org.eclipse.xtext.scoping.IScopeProvider
import org.eclipse.xtext.scoping.impl.AbstractDeclarativeScopeProvider
import org.eclipse.xtext.serializer.tokens.SerializerScopeProviderBinding
import org.eclipse.xtext.tasks.ITaskTagProvider
import org.eclipse.xtext.validation.CompositeEValidator
import org.eclipse.xtext.validation.ConfigurableIssueCodesProvider
import org.eclipse.xtext.validation.IResourceValidator
import org.eclipse.xtext.xbase.XbaseFactory
import org.eclipse.xtext.xbase.compiler.JvmModelGenerator
import org.eclipse.xtext.xbase.compiler.XbaseCompiler
import org.eclipse.xtext.xbase.compiler.output.TraceAwarePostProcessor
import org.eclipse.xtext.xbase.conversion.XbaseValueConverterService
import org.eclipse.xtext.xbase.imports.IImportsConfiguration
import org.eclipse.xtext.xbase.imports.ImportedTypesCollector
import org.eclipse.xtext.xbase.imports.TypeUsageCollector
import org.eclipse.xtext.xbase.jvmmodel.IJvmModelInferrer
import org.eclipse.xtext.xbase.jvmmodel.JvmModelAssociator
import org.eclipse.xtext.xbase.jvmmodel.JvmModelTargetURICollector
import org.eclipse.xtext.xbase.resource.BatchLinkableResourceStorageFacade
import org.eclipse.xtext.xbase.scoping.batch.ConstructorScopes
import org.eclipse.xtext.xbase.typesystem.computation.ITypeComputer
import org.eclipse.xtext.xbase.typesystem.internal.DefaultBatchTypeResolver
import org.eclipse.xtext.xbase.typesystem.internal.DefaultReentrantTypeResolver
import org.eclipse.xtext.xbase.typesystem.util.HumanReadableTypeNames
import org.eclipse.xtext.xbase.util.XExpressionHelper
import org.eclipse.xtext.xbase.validation.EarlyExitValidator
import org.eclipse.xtext.xbase.validation.ImplicitReturnFinder
import org.eclipse.xtext.tasks.ITaskFinder
import org.eclipse.xtend.core.tasks.XtendTaskFinder

/** 
 * Use this class to register components to be used at runtime / without the Equinox extension registry.
 */
class XtendRuntimeModule extends AbstractXtendRuntimeModule {

	def XbaseFactory bindXbaseFactory() {
		return XbaseFactory.eINSTANCE
	}

	def Class<? extends XExpressionHelper> bindXExpressionHelper() {
		return XtendExpressionHelper
	}

	override Class<? extends IValueConverterService> bindIValueConverterService() {
		return XtendValueConverterService
	}

	override void configureIScopeProviderDelegate(Binder binder) {
		binder.bind(IScopeProvider).annotatedWith(Names.named(AbstractDeclarativeScopeProvider.NAMED_DELEGATE)).to(XtendImportedNamespaceScopeProvider)
	}

	override void configureSerializerIScopeProvider(Binder binder) {
		binder.bind(IScopeProvider).annotatedWith(SerializerScopeProviderBinding).to(
			XtendSerializerScopeProvider)
	}

	def Class<? extends ConstructorScopes> bindConstructorScopes() {
		return AnonymousClassConstructorScopes
	}

	override Class<? extends IQualifiedNameProvider> bindIQualifiedNameProvider() {
		return XtendQualifiedNameProvider
	}

	override Class<? extends IDefaultResourceDescriptionStrategy> bindIDefaultResourceDescriptionStrategy() {
		return XtendResourceDescriptionStrategy
	}

	def Class<? extends JvmModelAssociator> bindJvmModelAssociator() {
		return IXtendJvmAssociations.Impl
	}

	def Class<? extends EarlyExitValidator> bindEarlyExitValidator() {
		return XtendEarlyExitValidator
	}

	def Class<? extends IOutputConfigurationProvider> bindIOutputConfigurationProvider() {
		return XtendOutputConfigurationProvider
	}

	def Class<? extends TargetURICollector> bindTargetURICollector() {
		return JvmModelTargetURICollector
	}

	def Class<? extends ReferenceFinder> bindReferenceFinder() {
		return XtendReferenceFinder
	}

	override Class<? extends ILocationInFileProvider> bindILocationInFileProvider() {
		return XtendLocationInFileProvider
	}

	def Class<? extends IImportsConfiguration> bindIImportsConfiguration() {
		return XtendImportsConfiguration
	}

	def Class<? extends TypeUsageCollector> bindTypeUsageCollector() {
		return XtendTypeUsageCollector
	}

	def Class<? extends ImportedTypesCollector> bindImportedTypesCollector() {
		return XtendImportedTypesUsageCollector
	}

	override Class<? extends ConfigurableIssueCodesProvider> bindConfigurableIssueCodesProvider() {
		return XtendConfigurableIssueCodes
	}

	def XtendFactory bindXtendFactory() {
		return XtendFactory.eINSTANCE
	}

	override Class<? extends DefaultBatchTypeResolver> bindDefaultBatchTypeResolver() {
		return TypeDeclarationAwareBatchTypeResolver
	}

	override Class<? extends DefaultReentrantTypeResolver> bindDefaultReentrantTypeResolver() {
		return XtendReentrantTypeResolver
	}

	def Class<? extends XbaseCompiler> bindXbaseCompiler() {
		return XtendCompiler
	}

	def Class<? extends TraceAwarePostProcessor> bindTraceAwarePostProcessor() {
		return UnicodeAwarePostProcessor
	}

	override Class<? extends ITypeComputer> bindITypeComputer() {
		return XtendTypeComputer
	}

	def Class<? extends IJvmModelInferrer> bindIJvmModelInferrer() {
		return XtendJvmModelInferrer
	}

	override Class<? extends Manager> bindIResourceDescription$Manager() {
		return XtendResourceDescriptionManager
	}

	override void configure(Binder binder) {
		super.configure(binder)
		binder.bind(boolean).annotatedWith(Names.named(CompositeEValidator.USE_EOBJECT_VALIDATOR)).toInstance(false)
	}

	override Class<? extends IResourceValidator> bindIResourceValidator() {
		return CachingResourceValidatorImpl
	}

	override Class<? extends ILinker> bindILinker() {
		return RuntimeLinker
	}

	/** 
	 * @since 2.4.2
	 */
	override void configureIResourceDescriptions(Binder binder) {
		binder.bind(IResourceDescriptions).to(EagerResourceSetBasedResourceDescriptions)
	}

	def Class<? extends IDValueConverter> bindIDValueConverter() {
		return JavaIDValueConverter
	}

	def Class<? extends IEObjectDocumentationProvider> bindIEObjectDocumentationProvider() {
		return XtendDocumentationProvider
	}

	def Class<? extends IFileHeaderProvider> bindFileHeaderProvider() {
		return XtendFileHeaderProvider
	}

	override Class<? extends IParser> bindIParser() {
		return CustomXtendParser
	}

	override Class<? extends Lexer> bindLexer() {
		return DisabledAntlrLexer
	}

	override Provider<InternalXtendLexer> provideInternalXtendLexer() {
		return [return new DisabledAntlrLexer(null)]
	}

	override void configureRuntimeLexer(Binder binder) {
		binder.bind(Lexer).annotatedWith(Names.named(LexerBindings.RUNTIME)).to(DisabledAntlrLexer)
		binder.bind(DisabledAntlrLexer).toProvider([return new DisabledAntlrLexer(null)])
	}

	def Class<? extends XbaseValueConverterService.IntUnderscoreValueConverter> bindIntUnderscoreValueConverter() {
		return IntUnderscoreValueConverter
	}

	def Class<? extends STRINGValueConverter> bindSTRINGValueConverter() {
		return StringValueConverter
	}

	def Class<? extends TokenRegionProvider> bindTokenRegionProvider() {
		return FlexTokenRegionProvider
	}

	override Class<? extends IPartialParsingHelper> bindIPartialParserHelper() {
		return XtendPartialParsingHelper
	}

	def Class<? extends ITaskTagProvider> bindTaskTagProvider() {
		return XtendTaskTagProvider
	}

	override Class<? extends EObjectAtOffsetHelper> bindEObjectAtOffsetHelper() {
		return XtendEObjectAtOffsetHelper
	}

	def Class<? extends ImplicitReturnFinder> bindImplicitReturnFinder() {
		return XtendImplicitReturnFinder
	}

	def Class<? extends HumanReadableTypeNames> bindHumanReadableTypeNames() {
		return LocalClassAwareTypeNames
	}

	def Class<? extends JvmModelGenerator> bindJvmModelGenerator() {
		return XtendGenerator
	}

	def Class<? extends IGenerator2> bindIGenerator2() {
		return XtendGenerator
	}

	def Class<? extends IResourceChangeRegistry> bindResourceChangeRegistry() {
		return NopResourceChangeRegistry
	}

	def Class<? extends TokenSourceProvider> bindTokenSourceProvider() {
		return XtendTokenSourceProvider
	}

	def Class<? extends IResourceStorageFacade> bindResourceStorageFacade() {
		return BatchLinkableResourceStorageFacade
	}

	def Class<? extends AbstractFileSystemSupport> bindAbstractFileSystemSupport() {
		return JavaIOFileSystemSupport
	}

	def Class<? extends MutableFileSystemSupport> bindMutableFileSystemSupport() {
		return JavaIOFileSystemSupport
	}

	def Class<? extends IContextualOutputConfigurationProvider> bindIContextualOutputConfigurationProvider() {
		return XtendOutputConfigurationProvider
	}

	def Class<? extends IShouldGenerate> bindIShouldGenerate() {
		return IShouldGenerate.Always
	}

	def Class<? extends ITaskFinder> bindITaskFinder() {
		return XtendTaskFinder
	}
}
